//
//  ApiHelper.swift
//  HackTest
//
//  Created by Данил Коротаев on 04.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation

class ApiHelper {
    private init() {}
    
    static var shared = ApiHelper()
    
    func login(login: String, password: String, completion: @escaping (Bool) -> ()) {
        let params = ["email": login, "password": password]
        do {
            let data = try JSONSerialization.data(withJSONObject: params, options: [])
            HttpHelper.shared.post(url: Methods.login, data: data) { (result) in
                switch result {
                case .success(let json):
                    do {
                        let decoded = try JSONSerialization.jsonObject(with: json, options: [])
                        if let dictFromJSON = decoded as? [String:Int] {
                            let defaults = UserDefaults.standard
                            defaults.set(dictFromJSON["access_token"], forKey: AccessTokenKey.accessToken)
                            completion(true)
                        }
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                    completion(false)
                }
            }
        } catch {
            print(error)
        }
    }
    
    
    func profile(completion: @escaping (Result<ProfileData, Error>) -> ()){
        guard let token = UserDefaults.standard.string(forKey: AccessTokenKey.accessToken) else {
            print("No token"); return
        }
        HttpHelper.shared.get(url: Methods.profile + "?token=\(token)") { (result) in
            switch result {
            case .success(let data):
                do{
                    guard let profileData = try? JSONDecoder().decode(ProfileData.self, from: data) else { return }
                    completion(.success(profileData))
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
    
    func chats(completion: @escaping (Result<[ChatInfo], Error>) -> ()) {
        guard let token = UserDefaults.standard.string(forKey: AccessTokenKey.accessToken) else {
            print("No token"); return
        }
        HttpHelper.shared.get(url: Methods.chats + "?token=\(token)") { (result) in
            switch result {
            case .success(let data):
                do{
                    guard let chatInfo = try? JSONDecoder().decode([ChatInfo].self, from: data) else { return }
                    completion(.success(chatInfo))
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
    
    func messages(chatId:Int, completion: @escaping (Result<[Message], Error>) -> ()) {
        guard let token = UserDefaults.standard.string(forKey: AccessTokenKey.accessToken) else {
            print("No token"); return
        }
        HttpHelper.shared.get(url: Methods.messages + "/\(chatId)?token=\(token)") { (result) in
            switch result {
            case .success(let data):
                do{
                    let decoded = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dictFromJSON = decoded as? [[String:Any]] {
                        var messages = [Message]()
                        dictFromJSON.forEach{ dict in
                            var isFromUser = false
                            if let bool = dict["isFromUser"] as? Bool {
                                isFromUser = bool
                            }
//                            messages.append(Message(content: dict["content"] as! String, isFromUser: isFromUser))
                            messages.append(Message(content: dict["content"] as! String, isFromUser: isFromUser, createdAt: dict["createdAt"] as! String))
                        }
                        completion(.success(messages))
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
    
}
