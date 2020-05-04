//
//  MedicalHistoryViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class MedicalHistoryViewController: UIViewController {
    
    @IBOutlet weak var fotterBackgroundView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    var expandedIndexCell: IndexPath?
    var expandedIndexSet : IndexSet = []
    var delegate: MedicinePageDelegate?
    var profileData: ProfileData?
    
    var dates: [String] = ["30.04.2020",
                         "24.03.2020",
                         "25.12.2019",
                         "15.02.2016",
                         "12.10.2013"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupFooterView()
        ApiHelper.shared.profile { (result) in
            switch result {
            case .success(let profile):
                self.update(profile)
            case .failure(_):
                DispatchQueue.main.sync {
                    self.showAlert(title: "Ошибка", message: "Что-то пошло не так")
                }
            }
        }
    }
    
    func update(_ profiledata: ProfileData) {
        self.profileData = profiledata
        self.profileData!.ills.reverse()
        DispatchQueue.main.sync {
            self.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 62
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    func setupFooterView() {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.5, y: 0.2)
        layer.endPoint = CGPoint(x: 0.5, y: 0.8)
        layer.colors        = [UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor, UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor]
        layer.frame         = fotterBackgroundView.bounds
        fotterBackgroundView.layer.insertSublayer(layer, at: 0)
        
    }
}


extension MedicalHistoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileData?.ills.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MedicalHistoryViewCell.self), for: indexPath) as! MedicalHistoryViewCell
        let isExpanded = expandedIndexSet.contains(indexPath.row)
        cell.descriptionView.isHidden = !isExpanded
        cell.shadowView.commonInit()
        cell.seekName.text = profileData?.ills[indexPath.row].text
        cell.dateLabel.text = dates[indexPath.row]
        cell.descriptionTextView.text =  profileData?.ills[indexPath.row].recommendations
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
        guard let cell = tableView.cellForRow(at: indexPath) as? MedicalHistoryViewCell  else { return }
        cell.changeIcon(isExpanded)
        updates.append(indexPath)
        tableView.reloadRows(at: updates, with: .automatic)
        cell.shadowView.commonInit()
        if let cell = tableView.cellForRow(at: updates[0]) as? MedicalHistoryViewCell {
            cell.shadowView.commonInit()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell =  tableView.cellForRow(at: indexPath) as? MedicalHistoryViewCell  else { return 85}
        cell.shadowView.commonInit()
        if(expandedIndexSet.contains(indexPath.row)) {
            return 300
        } else {
            return 85
        }
    }
}
