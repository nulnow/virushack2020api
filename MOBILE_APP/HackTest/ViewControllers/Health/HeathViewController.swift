//
//  HeathViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class HeathViewController: UIViewController {

    @IBOutlet weak var healthView: UIView!
    @IBOutlet weak var pressureView: UIView!
    @IBOutlet weak var temperatureView: UIView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        healthView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(healthViewPressed)))
        pressureView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(pressureViewPressed)))
        temperatureView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(temperatureViewPressed)))
    }
    
    @objc
    func healthViewPressed() {
        print("healthViewPressed")
    }
    
    @objc
    func pressureViewPressed() {
        print("pressureViewPressed")
    }
    
    @objc
    func temperatureViewPressed() {
        print("temperatureViewPressed")
    }
}
