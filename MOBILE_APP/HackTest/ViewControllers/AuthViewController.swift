//
//  AuthViewController.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var forgetPassword: UIButton!
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBAction func forgetButtonPressed(_ sender: Any) {
        
    }
    
    
    func checkAuth(login: String, password: String, completion: @escaping (Bool) -> ()) {
        ApiHelper.shared.login(login: login, password: password, completion: completion)
    }
    
    
    @IBAction func regButtonPressed(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: RegFirstViewController.identifire()) as?  RegFirstViewController else { return }
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func enterButtonPress(_ sender: Any) {
        guard let login = loginTextField.text, let password = passwordTextField.text, login != "", password != "" else {
            self.showAlert(title: "Ошибка", message: "Заполните поля")
            return
        }
        
        checkAuth(login: login, password: password) { result in
            if result {
                DispatchQueue.main.sync {
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: MainViewController.identifire()) else { return }
                    self.changeRootVC(vc: vc, options: .transitionFlipFromLeft)
                }
            } else {
                self.showAlert(title: "Ошибка", message: "Неверные логин и/или пароль")
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.autoKeyboardHide = true
        guard let token = UserDefaults.standard.string(forKey: AccessTokenKey.accessToken) else {
            print("No token");
            return
        }
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: MainViewController.identifire()) else { return }
        self.changeRootVC(vc: vc, options: .curveEaseIn)
    }
    
    override func keyboardShown(_ notification: Notification) {
        scrollView.contentInset.bottom = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
    }
    
    override func keyboardHidden(_ notification: Notification) {
        scrollView.contentInset = .zero
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardNotifications()
    }
}
