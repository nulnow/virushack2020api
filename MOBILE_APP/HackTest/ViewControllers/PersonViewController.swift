//
//  PersonViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var imageShadowView: UIView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bloodLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var SexLabel: UILabel!
    @IBOutlet weak var EditView: UIView!
    @IBOutlet weak var FIOLabel: UILabel!
    @IBOutlet weak var AvatarView: UIImageView!
    @IBOutlet weak var BirthDateLabel: UILabel!
    @IBOutlet weak var QRImageView: UIImageView!
    @IBOutlet weak var ProfileContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QRImageView.image = self.generateQRImage(stringQR: "самое лучшее приложение")
        setupShadow()
    }
    
    func setupShadow() {
        imageShadowView.layer.shadowPath = UIBezierPath(roundedRect: imageShadowView.bounds, cornerRadius: 62).cgPath
        imageShadowView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        imageShadowView.layer.shadowOpacity = 1
        imageShadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
        imageShadowView.layer.shadowRadius =  4
        imageShadowView.layer.borderWidth = 1
        imageShadowView.layer.borderColor = UIColor(hex: "#E2E2E2FF")?.cgColor
        imageShadowView.backgroundColor = .white
        
    }
}
