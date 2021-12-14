//
//  BaseViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import UIKit

class BaseViewController: UIViewController {

    var statusBarStyle = UIStatusBarStyle.default
    var onKeyBoardToggle: ((CGFloat) -> Void)?
    let logger = Logger()
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printVCLife()
        // MARK: Keyboard Observer
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
        // MARK: Keyboard Observer
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printVCLife(finish: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
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
}


// MARK: Show Keyboard

extension BaseViewController {
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            onKeyBoardToggle?(keyboardHeight)
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        onKeyBoardToggle?(0)
    }
}
