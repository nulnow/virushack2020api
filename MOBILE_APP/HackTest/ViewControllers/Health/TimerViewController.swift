//
//  TimerViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit


struct TimerData {
    var time: String
    var description: String
    var isActive: Bool
}


class TimerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var timers = [TimerData(time: "11:00", description: "Галопередол 10 кап., пн-вс", isActive: false),
                  TimerData(time: "12:15", description: "Арбидол 1 таб., сегодня", isActive: true)]
    
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
}


extension TimerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TimerTableViewCell.self), for: indexPath) as! TimerTableViewCell
        let i = indexPath.row
        cell.set(timers[i].time, timers[i].description, timers[i].isActive, nil)
        
        return cell
    }
}
