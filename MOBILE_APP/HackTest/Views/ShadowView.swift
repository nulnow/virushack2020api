//
//  ShadowView.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation
import UIKit


class ShadowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        setNeedsLayout()
        self.draw(self.bounds)
        commonInit()
    }
    
    func commonInit() {        
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 14).cgPath
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius =  10
        self.layer.cornerRadius = 14
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hex: "#E2E2E2FF")?.cgColor
        self.backgroundColor = UIColor(hex: "#ECECECFF")
    }
}
