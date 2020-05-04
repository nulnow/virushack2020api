//
//  BriefcaseViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class BriefcaseViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var briefcase = ["Галопередол 20 мл.", "Арбидол 10 шт.", "Нурофен 7 шт.", "Арбидол 10 шт."]
    
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


extension BriefcaseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        briefcase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BriefcaseTableViewCell.self), for: indexPath) as! BriefcaseTableViewCell
        let i = indexPath.row
        cell.set(name: briefcase[i])
        
        return cell
    }
}
