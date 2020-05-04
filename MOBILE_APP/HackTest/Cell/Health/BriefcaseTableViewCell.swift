//
//  BriefcaseTableViewCell.swift
//  HackTest
//
//  Created by Данил Коротаев on 01.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class BriefcaseTableViewCell: UITableViewCell {

    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func set(name: String) {
        nameLabel.text = name
    }
    
}
