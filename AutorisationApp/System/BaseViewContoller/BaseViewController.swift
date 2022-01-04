//
//  BaseViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import UIKit

protocol BaseNavigationDelegate: AnyObject {
    func navigationBackAction()
}

class BaseViewController: UIViewController {

    var keyShowBoard: ((CGFloat) -> Void)?
    var keyHideBoard: ((CGFloat) -> Void)?
    let logger = Logger()

    private var keyboardNotificationIsUsed = false

    weak var delegatBaseNavigation: BaseNavigationDelegate?
    // MARK: - Life cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printVCLife()
        setKeyboardNotification()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        printVCLife()
        setBackgraundColor()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printVCLife()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        printVCLife(finish: true)
        removeKeyboardNotification()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printVCLife(finish: true)
    }

    deinit {
        printVCLife(finish: true)
    }

    private func printVCLife(function: String =  #function, finish: Bool = false) {
        if finish {
            print( "🔴 \(self.className), \(function)")
        } else {
            print( "🟢 \(self.className), \(function)")
        }
    }

    private func setBackgraundColor() {
        self.view.backgroundColor = AColor.background
    }

    // MARK: - Notifications

    func isKeyboardNotification(_ isUsed: Bool) {
        self.keyboardNotificationIsUsed = isUsed
    }

    private func setKeyboardNotification() {
        if keyboardNotificationIsUsed {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

    }

    private func removeKeyboardNotification() {
        if keyboardNotificationIsUsed {
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
    
    // MARK: - NavigatioCotroller
    
    func navigationBackButton(isHidden: Bool) {
        
        if !isHidden {
            setLeftNavButton()
        }
        
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func navigationBar(isHidden: Bool) {
        self.navigationController?.setNavigationBarHidden(isHidden, animated: false)
    }
    
    // MARK: - Navigation Left Bar ButtonItem
    
    func setLeftNavButton() {
        let navButton = UIBarButtonItem.init(image: UIImage.init(named: "back"), style: .plain, target: self, action: #selector(self.action))
        self.navigationItem.leftBarButtonItem = navButton
    }
    
    @objc func action() {
        self.delegatBaseNavigation?.navigationBackAction()
    }
    
}

// MARK: Show Keyboard

extension BaseViewController {

    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            keyShowBoard?(keyboardHeight)
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        keyHideBoard?(0)
    }
}
