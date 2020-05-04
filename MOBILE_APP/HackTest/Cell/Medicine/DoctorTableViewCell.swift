//
//  DoctorTableViewCell.swift
//  HackTest
//
//  Created by Данил Коротаев on 04.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seekName: UILabel!
    @IBOutlet weak var iconimageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var shadowView: ShadowView!
    
    weak var tableView: UITableView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        // Configure the view for the selected state
    }
    
    func changeIcon(_ isExpanded: Bool) {
        UIView.animate(withDuration: 0.2) {
            if isExpanded {
                self.iconimageView?.image = #imageLiteral(resourceName: "arrow_down")
            } else {
                self.iconimageView?.image = #imageLiteral(resourceName: "arrow_right")
            }
            
        }
    }
}
