//
//  SettingsViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var exitButton: UIButton!
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: AccessTokenKey.accessToken)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: AuthViewController.identifire()) else { return }
        self.changeRootVC(vc: vc, options: .transitionFlipFromRight)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
