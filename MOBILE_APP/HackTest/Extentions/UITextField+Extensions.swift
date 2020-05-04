//
//  UITextField+Extensions.swift
//  HackTest
//
//  Created by Данил Коротаев on 04.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class TextField: UITextField {
        @IBInspectable var insetX: CGFloat = 0
        @IBInspectable var insetY: CGFloat = 0

        // placeholder position
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: insetX, dy: insetY)
        }

        // text position
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: insetX, dy: insetY)
        }
}
