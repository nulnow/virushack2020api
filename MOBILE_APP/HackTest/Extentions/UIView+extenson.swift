//
//  UIView+extenson.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
extension UIView {

    @IBInspectable
    public var cornerRadius: CGFloat {
        set (radius) {
            self.layer.cornerRadius = radius
        }

        get {
            return self.layer.cornerRadius
        }
    }

    @IBInspectable
    public var borderWidth: CGFloat  {
        set (borderWidth) {
            self.layer.borderWidth = borderWidth
        }
        
        get {
            return self.layer.borderWidth
        }
    }

    @IBInspectable
    public var borderColor:UIColor? {
        set (color) {
            self.layer.borderColor = color?.cgColor
        }

        get {
            if let color = self.layer.borderColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
    }
}


extension UIView {
    func setRotation(_ angle: CGFloat) {
        var angle = angle
        if angle < 0 {
            angle = 360 - angle
        }
        self.transform = CGAffineTransform(rotationAngle: angle * CGFloat(Double.pi) / 180)
    }
}
