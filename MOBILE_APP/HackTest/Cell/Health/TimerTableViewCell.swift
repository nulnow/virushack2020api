//
//  TimerTableViewCell.swift
//  HackTest
//
//  Created by Данил Коротаев on 01.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class TimerTableViewCell: UITableViewCell {

    @IBOutlet weak var activeSwitch: UISwitch!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func set(_ time: String, _ description: String, _ isActive: Bool, _ switchHandler: ((Bool) -> ())?) {
        activeSwitch.isOn = isActive
        timeLabel.text = time
        descriptionLabel.text = description
    }
    
}
