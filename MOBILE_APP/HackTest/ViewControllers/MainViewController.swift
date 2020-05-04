//
//  ViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

   
    @IBOutlet weak var plusTab: UIButton!
    @IBOutlet weak var settingsTab: UIButton!
    @IBOutlet weak var heathTab: UIButton!
    @IBOutlet weak var bookheartTab: UIButton!
    @IBOutlet weak var personTab: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabBarView: UIView!
    
    var viewcontrollers = [String: UIViewController]()
    
    weak var personVC: PersonViewController?
    weak var medicalHistoryVC: MedicinePageViewController?
    weak var chatVC: ChatListViewController?
    weak var healthVC: HeartPageViewController?
    weak var settingsVC: SettingsViewController?
    
    weak var currentVC: UIViewController?
    var profileData: ProfileData?
    
    @IBAction func personTabPress(_ sender: Any) {
        cleanContainerView()
        personVC = setupVC(identifire: PersonViewController.identifire()) as? PersonViewController
        currentVC = personVC
        personTab.setImage(#imageLiteral(resourceName: "person-tap"), for: .normal)
    }
    
    @IBAction func plusTabPress(_ sender: Any) {
        cleanContainerView()
        chatVC = setupVC(identifire: ChatListViewController.identifire()) as? ChatListViewController
        currentVC = chatVC
    }
    
    @IBAction func bookheartTabPress(_ sender: Any) {
        cleanContainerView()
        medicalHistoryVC = setupVC(identifire: MedicinePageViewController.identifire()) as? MedicinePageViewController
        medicalHistoryVC?.profileData = profileData
        bookheartTab.setImage(#imageLiteral(resourceName: "book-heart-tap"), for: .normal)
        currentVC = medicalHistoryVC
    }
    
    @IBAction func heathTabPress(_ sender: Any) {
        cleanContainerView()
        healthVC = setupVC(identifire: HeartPageViewController.identifire()) as? HeartPageViewController
        heathTab.setImage(#imageLiteral(resourceName: "heart-tap"), for: .normal)
        currentVC = healthVC
    }
    
    @IBAction func settingsTabPress(_ sender: Any) {
        cleanContainerView()
         settingsVC = setupVC(identifire: SettingsViewController.identifire()) as? SettingsViewController
        settingsTab.setImage(#imageLiteral(resourceName: "settings-tap"), for: .normal)
        currentVC = settingsVC
    }
    
    func cleanContainerView() {
        heathTab.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
        bookheartTab.setImage(#imageLiteral(resourceName: "book-heart"), for: .normal)
        personTab.setImage(#imageLiteral(resourceName: "person"), for: .normal)
        settingsTab.setImage(#imageLiteral(resourceName: "settings"), for: .normal)
        personVC?.view.removeFromSuperview()
        medicalHistoryVC?.view.removeFromSuperview()
        chatVC?.view.removeFromSuperview()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ApiHelper.shared.profile { (result) in
            switch result {
            case .success(let profile):
                self.profileData = profile
                DispatchQueue.main.sync {
                    self.personVC?.QRImageView.image = self.generateQRImage(stringQR: profile.guid)
                    self.personVC?.FIOLabel.text = profile.firstName + " " + profile.lastName
                }
            case .failure(_):
                DispatchQueue.main.sync {
                self.showAlert(title: "Ошибка", message: "Что-то пошло не так")
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personVC = setupVC(identifire: PersonViewController.identifire()) as? PersonViewController
        currentVC = personVC
    }
    
    
    func setupVC(identifire: String) -> UIViewController? {
        if viewcontrollers.index(forKey: identifire) == nil {
            guard let vc = storyboard?.instantiateViewController(identifier: identifire) else { return nil }
            viewcontrollers[identifire] = vc
            self.addChild(vc)
            vc.didMove(toParent: self)
        }
        
        viewcontrollers[identifire]?.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview((viewcontrollers[identifire]? .view)!)
        let views:  [String : Any] = ["view":  viewcontrollers[identifire]!.view!]
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue:0), metrics: nil, views: views))
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue:0), metrics: nil, views: views))
        
        UIView.transition(with: containerView, duration: 0.3, options: .transitionCrossDissolve, animations: {}, completion: nil)
        
        return  viewcontrollers[identifire]
    }

}

