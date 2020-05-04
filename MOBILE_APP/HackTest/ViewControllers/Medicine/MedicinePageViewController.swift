//
//  MedicinePageViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class MedicinePageViewController: UIViewController, MedicinePageDelegate {
    
    func getProfileData() -> ProfileData? {
        return profileData
    }
    
    
    @IBOutlet weak var tabBarStackView: UIStackView!
    @IBOutlet weak var historyPage: UIImageView!
    @IBOutlet weak var recipePage: UIImageView!
    @IBOutlet weak var warningPage: UIImageView!
    @IBOutlet weak var doctorPage: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    var pageVC: CustomPageViewController!
    var profileData: ProfileData?
    var currentVC: UIViewController?
    
    var currentVCIndex = 0 {
        didSet {
            if oldValue == currentVCIndex { return }
            setDefaultIcon()
            switch self.currentVCIndex {
            case 0:
                self.historyPage.image = #imageLiteral(resourceName: "book-heart-tap")
            case 1:
                self.recipePage.image = #imageLiteral(resourceName: "recipe_gray")
            case 2:
                self.warningPage.image = #imageLiteral(resourceName: "warning_gray")
            case 3:
                self.doctorPage.image = #imageLiteral(resourceName: "doctor_gray")
            default: return
            }
        }
    }
    
    
    
    var viewcontrollers = [String: UIViewController]()
    var indexviewControllers = [String(describing: MedicalHistoryViewController.self): 0,
                                String(describing: RecipeViewController.self): 1,
                                String(describing: ContraindicationViewController.self): 2,
                                String(describing: DoctorViewController.self): 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confugurePaveViewController()
        currentVCIndex = 0
    }
    
    func confugurePaveViewController() {
        guard let pageVC = storyboard?.instantiateViewController(identifier: CustomPageViewController.identifire()) as? CustomPageViewController  else { return }
        self.pageVC = pageVC
        pageVC.delegate = self
        pageVC.dataSource = self
        
        addChild(pageVC)
        pageVC.didMove(toParent: self)
        pageVC.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(pageVC.view)
        let views:  [String : Any] = ["pageView": pageVC.view!]
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue:0), metrics: nil, views: views))
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue:0), metrics: nil, views: views))
        
        guard let startVC = detailsViewControllerAt(index: currentVCIndex) else { return }
        setVC(startVC)
    }
    
    func setVC(_ vc: UIViewController) {
        currentVC = vc
        pageVC.setViewControllers([vc], direction: .forward, animated: true)
    }
    
    func detailsViewControllerAt(index: Int) -> UIViewController? {
        switch index {
        case 0:
            let identifire = MedicalHistoryViewController.identifire()
            if viewcontrollers.index(forKey: identifire) == nil{
                guard let vc = storyboard?.instantiateViewController(identifier: identifire) as? MedicalHistoryViewController else { return nil }
                viewcontrollers[identifire] = vc
            }
            return viewcontrollers[identifire]
        case 1:
            let identifire = RecipeViewController.identifire()
            if viewcontrollers.index(forKey: identifire) == nil{
                guard let vc = storyboard?.instantiateViewController(identifier: identifire) as? RecipeViewController else { return nil }
                viewcontrollers[identifire] = vc
            }
            return viewcontrollers[identifire]
        case 2:
            let identifire = ContraindicationViewController.identifire()
            if viewcontrollers.index(forKey: identifire) == nil{
                guard let vc = storyboard?.instantiateViewController(identifier: identifire) as? ContraindicationViewController else { return nil }
                viewcontrollers[identifire] = vc
            }
            return viewcontrollers[identifire]
        case 3:
            let identifire = DoctorViewController.identifire()
            if viewcontrollers.index(forKey: identifire) == nil{
                guard let vc = storyboard?.instantiateViewController(identifier: identifire) as? DoctorViewController else { return nil }
                viewcontrollers[identifire] = vc
            }
            return viewcontrollers[identifire]
        default:
            return nil
        }
    }
    
    
    func setDefaultIcon() {
        historyPage.image = #imageLiteral(resourceName: "book-heart")
        recipePage.image = #imageLiteral(resourceName: "recipe")
        warningPage.image = #imageLiteral(resourceName: "warning")
        doctorPage.image = #imageLiteral(resourceName: "doctor")
    }
}


extension MedicinePageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let identifire = viewController.identifire()
        guard var index = indexviewControllers[identifire] else { return nil }
        currentVCIndex = index
        if index == 0 {
            index = indexviewControllers.count - 1
        } else {
            index -= 1
        }
        
        return detailsViewControllerAt(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let identifire = viewController.identifire()
        guard var index = indexviewControllers[identifire] else { return nil }
        currentVCIndex = index
        if index == indexviewControllers.count - 1 {
            index = 0
        } else {
            index += 1
        }
        return detailsViewControllerAt(index: index)
    }
    
}


protocol MedicinePageDelegate {
    func getProfileData() -> ProfileData?
}
