//
//  ChatViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit



class ChatListViewController: UIViewController {
    
    @IBOutlet weak var recordingContentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tabBar: ShadowView!
    
    weak var recordVC: RecordingViewController?
    
//    var chats = [ChatData(avatarIamge: nil, title: "Кулаков Д.Б", lastMessage: "Bibendum fringilla eu... ", status: .noSend),
//                 ChatData(avatarIamge: nil, title: "Щеголев А.Г", lastMessage: "Cursus nunc sceleri...", status: .read),
//                 ChatData(avatarIamge: nil, title: "Гуриков Н.Р", lastMessage: "Biben ut est, volutpat", status: .delivered)]
    
    var chats = [ChatInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ApiHelper.shared.chats { (result) in
            switch result {
            case .success(let chats):
                self.chats = chats
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.sync {
                    self.showAlert(title: "Ошибка", message: "Что-то пошло не так")
                }
            }
        }
    }
    
    
    @IBAction func recordingButtonPressed(_ sender: Any) {
        if recordVC == nil {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: RecordingViewController.self)) as?  RecordingViewController else { return }
            recordVC = vc
            recordVC?.delegate = self
            addChild(vc)
            vc.didMove(toParent: self)
        }
        recordVC?.view.translatesAutoresizingMaskIntoConstraints = false
        recordingContentView.addSubview(recordVC!.view)
        self.view.bringSubviewToFront(recordingContentView)
        self.view.bringSubviewToFront(tabBar)
        let views:  [String : Any] = ["view":  recordVC!.view]
        recordingContentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue:0), metrics: nil, views: views))
        recordingContentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue:0), metrics: nil, views: views))
    }
    
}


extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChatTableViewCell.self), for: indexPath) as! ChatTableViewCell
        let i = indexPath.row
        cell.set(chats[i])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: ChatViewController.self)) as?  ChatViewController else { return }
        vc.chatData = chats[indexPath.row]
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}


extension ChatListViewController: RecordingViewControllerDelegate {
    func dismiss() {
        self.view.sendSubviewToBack(recordingContentView)
        recordVC?.view.removeFromSuperview()
    }
}
