//
//  HeartPageViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class HeartPageViewController: UIViewController {
    
    @IBOutlet weak var tabBarStackView: UIStackView!
    @IBOutlet weak var briefcase_medical: UIImageView!
    @IBOutlet weak var healthPage: UIImageView!
    @IBOutlet weak var timerPage: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    var pageVC: CustomPageViewController!
    
    var currentVCIndex = 0 {
        didSet {
            setDefaultIcon()
            switch self.currentVCIndex {
            case 0:
                self.briefcase_medical.image = #imageLiteral(resourceName: "briefcase-medical-gray")
            case 1:
                self.healthPage.image = #imageLiteral(resourceName: "heart-tap")
            case 2:
                self.timerPage.image = #imageLiteral(resourceName: "timer-gray")
            default: self.setDefaultIcon()
            }
        }
    }
    
    
    var viewcontrollers = [String: UIViewController]()
    var indexviewControllers = [String(describing: BriefcaseViewController.self): 0,
                                String(describing: HeathViewController.self): 1,
                                String(describing: TimerViewController.self): 2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentVCIndex = 0
        confugurePaveViewController()
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
        pageVC.setViewControllers([vc], direction: .forward, animated: true)
    }
    
    func detailsViewControllerAt(index: Int) -> UIViewController? {
        switch index {
        case 0:
            let identifire = BriefcaseViewController.identifire()
            if viewcontrollers.index(forKey: identifire) == nil{
                guard let vc = storyboard?.instantiateViewController(identifier: identifire) as? BriefcaseViewController else { return nil }
                viewcontrollers[identifire] = vc
            }
            return viewcontrollers[identifire]
        case 1:
            let identifire = HeathViewController.identifire()
            if viewcontrollers.index(forKey: identifire) == nil{
                guard let vc = storyboard?.instantiateViewController(identifier: identifire) as? HeathViewController else { return nil }
                viewcontrollers[identifire] = vc
            }
            return viewcontrollers[identifire]
        case 2:
            let identifire = TimerViewController.identifire()
            if viewcontrollers.index(forKey: identifire) == nil{
                guard let vc = storyboard?.instantiateViewController(identifier: identifire) as? TimerViewController else { return nil }
                viewcontrollers[identifire] = vc
            }
            return viewcontrollers[identifire]
        default:
            return nil
        }
    }
    
    
    func setDefaultIcon() {
        briefcase_medical.image = #imageLiteral(resourceName: "briefcase-medical")
        healthPage.image = #imageLiteral(resourceName: "heart")
        timerPage.image = #imageLiteral(resourceName: "timer")
    }
}


extension HeartPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
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
