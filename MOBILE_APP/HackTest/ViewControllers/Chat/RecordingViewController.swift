//
//  RecordingViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class RecordingViewController: UIViewController {
    var delegate: RecordingViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        delegate?.dismiss()
    }
}

protocol RecordingViewControllerDelegate {
    func dismiss()
}
