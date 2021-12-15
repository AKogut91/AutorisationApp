//
//  ViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak private var emailTextField: TextFieldView!
    @IBOutlet weak private var emailErrorLabel: ALabel!
    @IBOutlet weak private var passwordTextField: TextFieldView!
    @IBOutlet weak private var errorPasswordLabel: ALabel!
    @IBOutlet weak private var comfirmPasswordTextField: TextFieldView!
    @IBOutlet weak private var errorComfirmPasswordLabel: ALabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextViewFieldAndLabel()
    }
    
    private func setTextViewFieldAndLabel() {
        
        emailTextField.backgroundColor = .clear
        passwordTextField.backgroundColor = .clear
        comfirmPasswordTextField.backgroundColor = .clear
        
        emailTextField.style(type: .email, delegate: self)
        passwordTextField.style(type: .password, delegate: self)
        comfirmPasswordTextField.style(type: .comfirmPassword,  delegate: self)
        
        emailErrorLabel.style(type: .email)
        errorPasswordLabel.style(type: .password)
        errorComfirmPasswordLabel.style(type: .comfirmPassword)
        
    }
    
    // MARK: - Animation for TextFied and Label
    private func showHideError(type: TextFieldType, isShowError: Bool) {
        
        UIView.animate(withDuration: 0.33) { [unowned self] in
            switch type {
            case .email:
                if isShowError {
                    self.emailErrorLabel.showHideErrorLabel(isHidden: false, alpha: 1)
                    self.emailTextField.showHideErrorTextFieldBorder(error: true)
                } else {
                    
                    self.emailErrorLabel.showHideErrorLabel(isHidden: true, alpha: 0)
                    self.emailTextField.showHideErrorTextFieldBorder(error: false)
                }
                
            case .password:
                
                if isShowError {
                    self.errorPasswordLabel.showHideErrorLabel(isHidden: false, alpha: 1)
                    self.passwordTextField.showHideErrorTextFieldBorder(error: true)
                } else {
                    self.errorPasswordLabel.showHideErrorLabel(isHidden: true, alpha: 0)
                    self.passwordTextField.showHideErrorTextFieldBorder(error: false)
                }
            case .comfirmPassword:
                
                if isShowError {
                    self.errorComfirmPasswordLabel.showHideErrorLabel(isHidden: false, alpha: 1)
                    self.comfirmPasswordTextField.showHideErrorTextFieldBorder(error: true)
                } else {
                    self.errorComfirmPasswordLabel.showHideErrorLabel(isHidden: true, alpha: 0)
                    self.comfirmPasswordTextField.showHideErrorTextFieldBorder(error: false)
                }
            }
            self.view.layoutIfNeeded()
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    private func switchFields(textField: UITextField) {
        switch textField {
        case emailTextField.textfield:
            passwordTextField.textfield.becomeFirstResponder()
        case passwordTextField.textfield:
            comfirmPasswordTextField.textfield.becomeFirstResponder()
        case comfirmPasswordTextField.textfield:
            comfirmPasswordTextField.textfield.becomeFirstResponder()
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        if textField == emailTextField.textfield {
            if let email = textField.text {
                if !email.isEmail {
                    showHideError(type: .email, isShowError: true)
                } else {
                    showHideError(type: .email, isShowError: false)
                }
            }
        }
        
        // if textField == password.textfield {
        //     self.logger.Log()
        // }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == comfirmPasswordTextField.textfield {
            let comfirPasswordStr = textField.text ?? ""
            let passwordStr = self.passwordTextField.textfield.text ?? ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                if comfirPasswordStr.count > (passwordStr.count / 2) {
                    let comfPass = textField.text ?? ""
                    
                    if comfPass == passwordStr {
                        self.showHideError(type: .comfirmPassword, isShowError: false)
                        self.logger.Log()
                    } else {
                        
                        if comfPass.isEmpty {
                            self.showHideError(type: .comfirmPassword, isShowError: false)
                            self.logger.Log()
                            
                        } else {
                            self.showHideError(type: .comfirmPassword, isShowError: true)
                            self.logger.Log()
                        }
                    }
                    
                } else {
                    self.showHideError(type: .comfirmPassword, isShowError: false)
                    self.logger.Log()
                }
            }
            
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchFields(textField: textField)
        return true;
    }
    
}

