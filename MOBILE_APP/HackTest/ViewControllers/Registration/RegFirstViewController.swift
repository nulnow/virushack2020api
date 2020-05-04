//
//  RegViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class RegFirstViewController: UIViewController {

    @IBAction func nextControllerPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: RegSecondViewController.self)) as?  RegSecondViewController else { return }
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
