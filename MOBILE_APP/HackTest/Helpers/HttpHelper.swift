//
//  HttpHelper.swift
//  HackTest
//
//  Created by Данил Коротаев on 04.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation

class HttpHelper {
    private init() {}
    static var shared = HttpHelper()
    
    func get(url: String, completion: @escaping (Result<Data,Error>) -> ()) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.timeoutInterval = Double.greatestFiniteMagnitude
        let headers = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        request.allHTTPHeaderFields = headers
        URLSession.shared.dataTask(with: request) {data, responce, error in
            if let error = error { print(error); completion(.failure(error)); return;}
            if let data = data {
                if let message = String(data: data, encoding: .utf8) {
                    print(message)
                    completion(.success(data))
                }
            }
            return
        }.resume()
        print("Fetch \(url)")
    }
    
    func post(url: String, data: Data, completion: @escaping (Result<Data,Error>) -> ()) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.httpBody = data
        request.timeoutInterval = Double.greatestFiniteMagnitude
        let headers = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        request.allHTTPHeaderFields = headers
        URLSession.shared.dataTask(with: request) {data, responce, error in
            if let error = error { print(error); completion(.failure(error)); return;}
            if let data = data {
                if let message = String(data: data, encoding: .utf8) {
                    print(message)
                    completion(.success(data))
                }
            }
            return
        }.resume()
        print("Fetch \(url)")
    }
}
