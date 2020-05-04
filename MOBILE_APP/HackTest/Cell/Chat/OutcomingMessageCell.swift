//
//  OutcomingMessageCell.swift
//  HackTest
//
//  Created by Данил Коротаев on 01.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit


class OutcomingMessageCell: UITableViewCell, MessageCell, Preparable {
     @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    private(set) var isPrepared: Bool  = false
    
    func prepare() {
        setShadow()
        if isPrepared {
            return
        }
        
        self.setRotation(180)
        isPrepared = true
    }
    
    func setShadow() {
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 14).cgPath
        shadowView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowOffset = CGSize(width: 5, height: 10)
        shadowView.layer.shadowRadius =  5
        shadowView.layer.cornerRadius = 14
        shadowView.backgroundColor = .white
        shadowView.layer.borderWidth = 1
        shadowView.layer.borderColor = UIColor(hex: "#ECECECFF")?.cgColor
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    
    func set(_ message: Message) {
        messageLabel.text = message.content
        dateLabel.text = message.createdAt
        setShadow()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
