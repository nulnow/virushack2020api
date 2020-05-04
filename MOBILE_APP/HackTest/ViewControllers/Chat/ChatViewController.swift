//
//  ChatViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit
import SocketIO

class ChatViewController: UIViewController {
    
    var messages = [Message]()
//        [OutcomingMessage(text: "Обои"),
//                               IncomingMessage(text: "Боль тянущяя или колющая?"),
//                               OutcomingMessage(text: "В пояснице"),
//                               OutcomingMessage(text: "Спину ломит"),
//                               IncomingMessage(text: "Так. По-подробнее, пожалуйста"),
//                               OutcomingMessage(text: "Все плохо"),
//                               IncomingMessage(text: "Рассказывайте, что случилось?") ]
    
    var chatData: ChatInfo!
    var socket: SocketIOClient?
    var manager: SocketManager!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextFiled: ShadowTextField!
    
    @IBAction func backBattonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if let text = messageTextFiled.text, text  != "" {
            socket?.emit("MESSAGE", ["chatId": chatData.id, "content": text])
            messages.insert(Message(content: text, isFromUser: true, createdAt: ""), at: 0)
            messageTextFiled.text  = ""
            tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.setRotation(180)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.frame.width - 10)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 60
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = chatData.doctor.name
        
        ApiHelper.shared.messages(chatId: chatData.id) { (result) in
            switch result {
            case .success(let messages):
                self.addMessages(messages)
            case .failure(let error):
                DispatchQueue.main.sync {
                    self.showAlert(title: "Ошибка", message: "Что-то пошло не так")
                }
                print(error)
            }
        }
        
        guard let token = UserDefaults.standard.string(forKey: AccessTokenKey.accessToken) else {
            print("No token"); return
        }
        
        manager = SocketManager(socketURL: URL(string: Endpoinds.serverUrl)!, config: [.log(true), .compress])
        socket = manager.defaultSocket
        self.socket?.on(clientEvent: .connect) {data, ack in
            print("socket connected")
            self.socket?.emit("AUTH", ["token": token])
        }
        socket?.on("MESSAGE") {data, ack in
            guard let message = data[0] as? Message else { return }
            DispatchQueue.main.sync {
                self.addMessage(message)
            }
        }
        socket?.connect()
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        socket?.disconnect()
    }
    
    func addMessages(_ messages: [Message]) {
        self.messages = messages
        self.messages.reverse()
        DispatchQueue.main.sync {
            tableView.reloadData()
        }
    }
    
    func addMessage(_ message: Message) {
        messages.append(message)
        tableView.reloadData()
    }
    
}


extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row
        if !messages[i].isFromUser {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: IncomingMessageCell.self), for: indexPath) as! IncomingMessageCell
            cell.set(messages[i])
            cell.prepare()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OutcomingMessageCell.self), for: indexPath) as! OutcomingMessageCell
            cell.set(messages[i])
            cell.prepare()
            return cell
        }
    }
    
}
