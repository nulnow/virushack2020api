//
//  RecipeViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    @IBOutlet weak var fotterBackgroundView: UIView!
    var expandedIndexSet : IndexSet = []
    var expandedIndexCell: IndexPath?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupFooterView()
    }
    
    var recipies: [RecipeData] = [RecipeData(name: "Коронавирус", date: "25.03.2020", text: "Инъекции \"Байзер\" (3 раза в день, курс 10 дней). Принимать таблетки \"СтопГрипан\" (3 раза в день, (курс 10 дней).", doctorName: "Кулаков Д.Б"),
   
    RecipeData(name: "Инсульт", date: "15.02.2016", text: "Принимать: \"Панангин\" (2 раза в день, курс 21 день). Минимизировать нагрузку на сердце, избегать нервного напряжения.", doctorName: "Гуриков Н.Р"),
    
     RecipeData(name: "Конъюнктивит", date: "12.10.2013", text: "\"Инродоз\" (по 2 капли в глаза 3 раза в день, курс 12 дней) и антибиотики \"Антиглазалин\" (1 раз в день, курс 10 дней).", doctorName: "Щеголев А.Г")]
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
//        tableView.rowHeight = UITableView.automaticDimension
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


extension RecipeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipies.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeTableViewCell.self), for: indexPath) as! RecipeTableViewCell
//        let isExpanded = expandedIndexSet.contains(indexPath.row)
//        cell.descriptionView.isHidden = !isExpanded
//        cell.shadowView.commonInit()
//        cell.descriptionTextView.text = recipies[indexPath.row].text
//        cell.doctorNameLabel.text = recipies[indexPath.row].name
//        cell.dateLabel.text = recipies[indexPath.row].date
//        cell.seekName.text = recipies[indexPath.row].doctorName
//
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
//        if let cell =  tableView.cellForRow(at: indexPath) as? RecipeTableViewCell {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeTableViewCell.self), for: indexPath) as! RecipeTableViewCell
        let isExpanded = expandedIndexSet.contains(indexPath.row)
        cell.descriptionView.isHidden = !isExpanded
        cell.shadowView.commonInit()
        cell.descriptionTextView.text = recipies[indexPath.row].text
        cell.doctorNameLabel.text = recipies[indexPath.row].doctorName
        cell.dateLabel.text = recipies[indexPath.row].date
        cell.seekName.text = recipies[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var updates =  [IndexPath]()
        if let expandedIndexCell = self.expandedIndexCell {
            if expandedIndexCell != indexPath {
                expandedIndexSet.remove(expandedIndexCell.row)
            }
            updates.append(expandedIndexCell)
        }
        let isExpanded = expandedIndexSet.contains(indexPath.row)
        if  isExpanded {
            expandedIndexCell = nil
            expandedIndexSet.remove(indexPath.row)
        } else {
            expandedIndexSet.insert(indexPath.row)
            expandedIndexCell = indexPath
        }
        guard let cell =  tableView.cellForRow(at: indexPath) as? RecipeTableViewCell  else { return }
        cell.changeIcon(isExpanded)
        updates.append(indexPath)
        tableView.reloadRows(at: updates, with: .automatic)
        cell.shadowView.commonInit()
        if let cell = tableView.cellForRow(at: updates[0]) as? RecipeTableViewCell {
            cell.shadowView.commonInit()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell =  tableView.cellForRow(at: indexPath) as? RecipeTableViewCell  else { return 85}
        cell.shadowView.commonInit()
        if(expandedIndexSet.contains(indexPath.row)) {
            return 300
        } else {
            return 85
        }
    }
    
}
