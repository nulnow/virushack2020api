//
//  ChatTableViewCell.swift
//  HackTest
//
//  Created by Данил Коротаев on 01.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func set(_ data: ChatInfo) {
        titleLabel.text = data.doctor.name
//        lastMessage.text = data.lastMessage        
    }
}
