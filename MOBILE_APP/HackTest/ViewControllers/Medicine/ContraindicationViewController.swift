//
//  ContraindicationViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class ContraindicationViewController: UIViewController {
    @IBOutlet weak var fotterBackgroundView: UIView!
    var expandedIndexSet : IndexSet = []
    var expandedIndexCell: IndexPath?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupFooterView()
    }
    
    var recipies: [String] = ["Аллергия на кокос", "Аллергия на Кофеин", "Непереносимость \"Повидона\"" ]
    
    var delegate: MedicinePageDelegate?
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupFooterView() {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.5, y: 0.2)
        layer.endPoint = CGPoint(x: 0.5, y: 0.8)
        layer.colors        = [UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor, UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor]
        layer.frame         = fotterBackgroundView.bounds
        fotterBackgroundView.layer.insertSublayer(layer, at: 0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
}


extension ContraindicationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipies.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContraindicationTableViewCell.self), for: indexPath) as! ContraindicationTableViewCell
//        let isExpanded = expandedIndexSet.contains(indexPath.row)
//        cell.descriptionView.isHidden = !isExpanded
//        cell.shadowView.commonInit()
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let isExpanded = expandedIndexSet.contains(indexPath.row)
//        if  isExpanded {
//            expandedIndexSet.remove(indexPath.row)
//        } else {
//            expandedIndexSet.insert(indexPath.row)
//        }
//        if let cell =  tableView.cellForRow(at: indexPath) as? ContraindicationTableViewCell {
//            cell.changeIcon(isExpanded)
//        }
//        tableView.reloadRows(at: [indexPath], with: .automatic)
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if(expandedIndexSet.contains(indexPath.row)) {
//            return 300
//        } else {
//            return 85
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContraindicationTableViewCell.self), for: indexPath) as! ContraindicationTableViewCell
        let isExpanded = expandedIndexSet.contains(indexPath.row)
        cell.descriptionView.isHidden = !isExpanded
        cell.seekName.text = recipies[indexPath.row]
        cell.dateLabel.text = ""
        cell.shadowView.commonInit()
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var updates =  [IndexPath]()
//        if let expandedIndexCell = self.expandedIndexCell {
//            if expandedIndexCell != indexPath {
//                expandedIndexSet.remove(expandedIndexCell.row)
//            }
//            updates.append(expandedIndexCell)
//        }
//        let isExpanded = expandedIndexSet.contains(indexPath.row)
//        if  isExpanded {
//            expandedIndexCell = nil
//            expandedIndexSet.remove(indexPath.row)
//        } else {
//            expandedIndexSet.insert(indexPath.row)
//            expandedIndexCell = indexPath
//        }
//        guard let cell =  tableView.cellForRow(at: indexPath) as? ContraindicationTableViewCell  else { return }
//        cell.changeIcon(isExpanded)
//        updates.append(indexPath)
//        tableView.reloadRows(at: updates, with: .automatic)
//        cell.shadowView.commonInit()
//        if let cell = tableView.cellForRow(at: updates[0]) as? ContraindicationTableViewCell {
//            cell.shadowView.commonInit()
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell =  tableView.cellForRow(at: indexPath) as? ContraindicationTableViewCell  else { return 85}
        cell.shadowView.commonInit()
        if(expandedIndexSet.contains(indexPath.row)) {
            return 300
        } else {
            return 85
        }
    }
}
