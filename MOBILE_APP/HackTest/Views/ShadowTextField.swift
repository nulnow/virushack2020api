//
//  ShadowTextField.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation
import UIKit

class ShadowTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 14
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hex: "#E2E2E2FF")?.cgColor
        self.backgroundColor = UIColor(hex: "#E3E3E3FF")
//        let layer = CAGradientLayer()
//        layer.cornerRadius = 14
//        layer.startPoint    = CGPoint(x: 1.0, y: 1.0)
//        layer.endPoint      = CGPoint(x: 0.0, y: 0.0)
//        layer.colors        = [UIColor(red: 0.79, green:  0.77, blue: 0.77, alpha: 0.25).cgColor, UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor]
//        layer.frame         = self.bounds
//        self.layer.insertSublayer(layer, at: 0)
    }
}
