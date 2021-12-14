//
//  ViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var emailTextField: TextFieldView!
    @IBOutlet weak var password: TextFieldView!
    @IBOutlet weak var comfirPassword: TextFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextViewField()
    }
    
    
    func setTextViewField() {
        emailTextField.style(type: .email, delegate: self)
        password.style(type: .password,  delegate: self)
        comfirPassword.style(type: .comfirmPassword,  delegate: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.emailTextField.style(type: .errorEmail, delegate: self)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    
    
}

