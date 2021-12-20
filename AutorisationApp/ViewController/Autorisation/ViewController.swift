//
//  ViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import UIKit

class ViewController: BaseViewController  {
   
    @IBOutlet weak private var topLabel: ALabel!
    @IBOutlet weak private var topLabelFooter: ALabel!
    @IBOutlet weak private var emailTextField: TextFieldView!
    @IBOutlet weak private var passwordTextField: TextFieldView!
    @IBOutlet weak private var comfirmPasswordTextField: TextFieldView!
    @IBOutlet weak private var privatePolicyTextView: ATextView!
    @IBOutlet weak private var singUp: AButton!
    @IBOutlet weak private var signInSocialMediaLabel: ALabel!
    @IBOutlet weak private var singInApple: AButton!
    @IBOutlet weak private var singInGoogle: AButton!
    @IBOutlet weak private var loginTextView: ATextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextViewFieldAndLabel()
        setupLabel()
        setupButton()
        setupTextView()
    }
    
    // MARK: - Setup
    
    private func setTextViewFieldAndLabel() {
        emailTextField.backgroundColor = .clear
        passwordTextField.backgroundColor = .clear
        comfirmPasswordTextField.backgroundColor = .clear
        
        emailTextField.style(type: .email, placeholder: "Email")
        passwordTextField.style(type: .password, placeholder: "Password")
        comfirmPasswordTextField.style(type: .comfirmPassword(passwordTextField), placeholder: "Comfirm Password")
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        comfirmPasswordTextField.delegate = self
    }
    
    private func setupLabel() {
        topLabel.style(type: .top, text: "Create account")
        topLabelFooter.style(type: .header, text: "Let’s create an account to save your results and secure your journal.")
        signInSocialMediaLabel.style(type: .fotter, text: "or sign up with social media account:")
    }
    
    func setupTextView() {
        
        privatePolicyTextView.aTextViewDelegate = self
        loginTextView.aTextViewDelegate = self
        
        privatePolicyTextView.style(type: .undeline,
                                    text: "By continuing, you agree with Privacy Policy & Terms of Use.")
        privatePolicyTextView.addAttr((text: "Privacy Policy", type: .link, "111"))
        privatePolicyTextView.addAttr((text: "Privacy Policy", type: .color, AColor.purpleColor))
        
        privatePolicyTextView.addAttr((text: "Terms of Use.", type: .link, "222"))
        privatePolicyTextView.addAttr((text: "Terms of Use.", type: .color, AColor.purpleColor))
        privatePolicyTextView.setup()
        
        loginTextView.style(type: .undeline,
                            text: "Already have an account? Log in")
        loginTextView.addAttr((text: "Log in", type: .link, "333"))
        loginTextView.addAttr((text: "Log in", type: .color, AColor.purpleColor))
        loginTextView.setup()
    }
    
    private func setupButton() {
        singUp.style(buttonStyle: .standart, buttonCornerStyle: .default, text: "Sign up")
        singInApple.style(buttonStyle: .socialLogin, buttonCornerStyle: .default, text: "Sign up with Apple")
        singInGoogle.style(buttonStyle: .socialLogin, buttonCornerStyle: .default, text: "Sign up with Google")
    }
    
    // MARK: - Actions
  

}

// MARK: - TextFieldViewDelegate
extension ViewController: TextFieldViewDelegate {
    
    func shouldReturn(_ sender: TextFieldView) -> Bool {
        if let view = self.view.viewWithTag(sender.tag + 1) {
            view.becomeFirstResponder()
        } else {
            sender.resignFirstResponder()
        }
        return false
    }

}

// MARK: - ATextViewDelegate
extension ViewController: ATextViewDelegate {
    
    func showLoging() {
        self.showComingSoonAlert()
    }
    
    func showPrivatePolicy() {
        self.showComingSoonAlert()
    }
    
    func showTermsofUse() {
        self.showComingSoonAlert()
    }
}

