//
//  ViewController+Extensions.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation
import UIKit
import CoreImage.CIFilterBuiltins
import QuickLook

extension UIViewController {
    
    func generateQRImage(stringQR: String) -> UIImage? {
        let data = Data(stringQR.utf8)
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()

        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("H", forKey: "inputCorrectionLevel")
        
        if let outputImage = filter.outputImage {
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let scaledQrImage = outputImage.transformed(by: transform)
            if let cgimg = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return nil
    }
}


 // MARK: - AUTOKEYBOARD HIDE
fileprivate var autoKeyboardHide_FILEPRIVATE: [ObjectIdentifier:Bool] = [:]
fileprivate var autoKeyboardHide_DEFAULT: Bool = false

fileprivate var tapGestureRecognizer_FILEPRIVATE: [ObjectIdentifier:UITapGestureRecognizer] = [:]
fileprivate var tapGestureRecognizer_DEFAULT: UITapGestureRecognizer = UITapGestureRecognizer()

extension UIViewController {
    
    var tapGestureRecognizer: UITapGestureRecognizer {
        get { return tapGestureRecognizer_FILEPRIVATE[ObjectIdentifier(self)] ?? tapGestureRecognizer_DEFAULT }
        set { tapGestureRecognizer_FILEPRIVATE[ObjectIdentifier(self)] = newValue }
    }
  
    
    var autoKeyboardHide: Bool {
        get { return autoKeyboardHide_FILEPRIVATE[ObjectIdentifier(self)] ?? autoKeyboardHide_DEFAULT }
        set { autoKeyboardHide_FILEPRIVATE[ObjectIdentifier(self)] = newValue }
    }
    
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(handle_KeyboardShown), name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(handle_KeyboardHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
     }

     func removeKeyboardNotifications() {
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func handle_KeyboardShown(_ notification: Notification) {
        if autoKeyboardHide {
            addTapRecognizerKeyboardHide()
        }
        keyboardShown(notification)
    }

    @objc
    func handle_KeyboardHidden(_ notification: Notification) {
        if autoKeyboardHide {
            removeTapRecognizerKeyboardHide()
        }
        keyboardHidden(notification)
    }
    
    @objc
    func keyboardShown(_ notification: Notification) {
        
    }
    
    @objc
    func keyboardHidden(_ notification: Notification) {
        
    }
    
    func addTapRecognizerKeyboardHide() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func removeTapRecognizerKeyboardHide() {
        view.removeGestureRecognizer(tapGestureRecognizer)
    }
}



 // MARK: - ALERTS
extension UIViewController: QLPreviewControllerDelegate {
    
    func showPicker(title: String?, message: String?, delegate: UIPickerViewDelegate, source: UIPickerViewDataSource, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message ?? "\n\n\n\n\n\n", preferredStyle: .alert)
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))
        alert.view.addSubview(pickerFrame)
        pickerFrame.dataSource = source
        pickerFrame.delegate = delegate
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        actions.forEach { alert.addAction($0) }
        
        self.present(alert,animated: true, completion: nil )
    }
    
    
    func showAlert(title: String?, message: String?) {
        self.showAlert(title: title, message: message, actions: [UIAlertAction(title: "OK", style: .default)])
        
    }
    
    func showAlert(title: String?, message: String?, actions: [UIAlertAction]) {
        self.showAlertController(title: title, message: message, preferredStyle: .alert, actions: actions)
    }
    
    func showAlertController(title: String?, message: String?, preferredStyle: UIAlertController.Style, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        actions.forEach { alert.addAction($0) }
        self.present(alert, animated: true, completion: nil)
    }
    
    func showActons(title: String?, message: String?, actions: [UIAlertAction], withCancelButton: Bool = true) {
        var _actions = actions
        if withCancelButton {
            _actions.append(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        }
        self.showAlertController(title: title, message: message, preferredStyle: .actionSheet, actions: _actions)
    }
    
    func showImages(paths: [String]) {
        DispatchQueue.main.sync {
            let previewController = QLPreviewController()
            let previewItems = paths.map { NSURL( fileURLWithPath: $0, isDirectory: false) as QLPreviewItem }.filter { QLPreviewController.canPreview($0) }
            let dataSource = PreviewDataSource(qlItems: previewItems)
            previewController.dataSource = dataSource
            previewController.delegate = self
            self.present(previewController, animated: true, completion: nil)
        }
    }
}


 // MARK: - LOADER
var vSpinner : UIView?

extension UIViewController {
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}


 // MARK: - UISTORYBOARD
extension UIViewController {
    
    func getVC(storyboardName: String, identifier: String) -> UIViewController   {
        let viewController = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(identifier: identifier)
        return viewController
    }
}


//  MARK: - ANIMATION
extension UIViewController {
    func changeRootVC(vc: UIViewController, options: UIView.AnimationOptions = [], duration: TimeInterval = 0.3) {
        guard let window = UIApplication.shared.windows.first  else { return }
        window.rootViewController = vc
        let duration: TimeInterval = 0.3
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: nil)
    }
}

//  MARK: - IDENTIFIRE
extension UIViewController {
    func identifire() -> String {
        let identifire = String(describing: Mirror(reflecting: self).subjectType)
        return identifire
    }
    
    static func identifire() -> String {
        let identifire = String(describing: self.self)
        return identifire
    }
    
}
