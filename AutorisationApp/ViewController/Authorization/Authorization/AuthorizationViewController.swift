//
//  ViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import UIKit

class AuthorizationViewController: BaseViewController {
    
    @IBOutlet weak private var topLabel: UILabel!
    @IBOutlet weak private var topLabelFooter: UILabel!
    @IBOutlet weak private var emailTextField: TextFieldView!
    @IBOutlet weak private var passwordTextField: TextFieldView!
    @IBOutlet weak private var comfirmPasswordTextField: TextFieldView!
    @IBOutlet weak private var privatePolicyTextView: ATextView!
    @IBOutlet weak private var singUp: AButton!
    @IBOutlet weak private var signInSocialMediaLabel: ATextView!
    @IBOutlet weak private var singInApple: AButton!
    @IBOutlet weak private var singInGoogle: AButton!
    @IBOutlet weak private var loginTextView: ATextView!
    
    var viewModel: AuthorizationViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBackButton(isHidden: false)
        self.delegatBaseNavigation = self
        setTextViewFieldAndLabel()
        setupAuthorizationType()
        setupButton()
    }
    
    // MARK: - Setup
    
    private func setupAuthorizationType() {
        switch viewModel?.getAuthorizationType() {
        case .login:
            UIView.animate(withDuration: 0.33) { [unowned self] in
                self.comfirmPasswordTextField.isHidden = true
                self.comfirmPasswordTextField.alpha = 0
            }
            
            setupTextView(type: .login)
            setupLabel(topText: "Glad to see you again!", footerText: "We appreciate your efforts and desire to work on yourself.")
            
        case .registration:
            
            UIView.animate(withDuration: 0.33) { [unowned self] in
                self.comfirmPasswordTextField.isHidden = false
                self.comfirmPasswordTextField.alpha = 1
            }
            
            setupTextView(type: .registration)
            setupLabel(topText: "Create account", footerText: "Let’s create an account to save your results and secure your journal")
        case .none:
            print("❤️ none")
        }
    }
    
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
    
    private func setupLabel(topText: String, footerText: String) {
        topLabel.textColor = AColor.topTextColor
        topLabel.text = topText
        topLabel.font = AFonts.semiBold.size(.s28)
        
        topLabelFooter.textColor = AColor.topTextColor
        topLabelFooter.text = footerText
        topLabelFooter.font = AFonts.regular.size(.s14)
        
    }
    
    private func setupTextView(type: AuthorizationType) {
        switch type {
        case .registration:
            privatePolicyTextView.aTextViewDelegate = self
            loginTextView.aTextViewDelegate = self
            
            signInSocialMediaLabel.style(text: "or sign up with social media account:", textColor: AColor.topTextColor)
            signInSocialMediaLabel.setup()
            
            privatePolicyTextView.style(text: "By continuing, you agree with Privacy Policy & Terms of Use.")
            privatePolicyTextView.addAttr( AttributesText(text: "Privacy Policy", type: .link, value: "111"))
            privatePolicyTextView.addAttr(AttributesText(text: "Privacy Policy", type: .color, value: AColor.purpleColor))
            
            privatePolicyTextView.addAttr(AttributesText(text: "Terms of Use.", type: .link, value: "222"))
            privatePolicyTextView.addAttr(AttributesText(text: "Terms of Use.", type: .color, value: AColor.purpleColor))
            privatePolicyTextView.setup()
            
            loginTextView.style(text: "Already have an account? Log in")
            loginTextView.addAttr(AttributesText(text: "Log in", type: .link, value: "333"))
            loginTextView.addAttr(AttributesText(text: "Log in", type: .color, value: AColor.purpleColor))
            loginTextView.setup()
        case .login:
            
            privatePolicyTextView.aTextViewDelegate = self
            loginTextView.aTextViewDelegate = self
            signInSocialMediaLabel.aTextViewDelegate = self
            
            signInSocialMediaLabel.style(text: "Forgot your password?",
                                         textColor: AColor.purpleColor, aligmentText: .left)
            
            signInSocialMediaLabel.addAttr( AttributesText(text: "Forgot your password?", type: .linkWithOutLine, value: "444"))
            signInSocialMediaLabel.setup()
            
            privatePolicyTextView.style(text: "or sign up with social media account:", textColor: AColor.topTextColor)
            privatePolicyTextView.setup()
            
            loginTextView.style(text: "Have no account yet? Sign up", textColor: AColor.purpleColor)
            loginTextView.addAttr(AttributesText(text: "Sign up", type: .link, value: "333"))
            loginTextView.addAttr(AttributesText(text: "Sign up", type: .color, value: AColor.purpleColor))
            loginTextView.setup()
        }
    }
    
    private func setupButton() {
        singUp.style(buttonStyle: .standart, buttonCornerStyle: .default, text: "Sign up")
        singInApple.style(buttonStyle: .socialLogin, buttonCornerStyle: .default, text: "Sign up with Apple")
        singInGoogle.style(buttonStyle: .socialLogin, buttonCornerStyle: .default, text: "Sign up with Google")
    }
    
    // MARK: - Actions
    
    @IBAction func singUpActions(_ sender: Any) {
        self.showComingSoonAlert()
    }
    
    @IBAction func singUpAppleActions(_ sender: Any) {
        self.showComingSoonAlert()
    }
    
    @IBAction func singUpGoogleActions(_ sender: Any) {
        self.showComingSoonAlert()
    }
}

// MARK: - DelegatBaseNavigation

extension AuthorizationViewController: BaseNavigationDelegate {
    func navigationBackAction() {
        self.viewModel?.pop()
    }
}

// MARK: - TextFieldViewDelegate
extension AuthorizationViewController: TextFieldViewDelegate {
    
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
extension AuthorizationViewController: ATextViewDelegate {
    func didSelected(item: String) {
        switch item {
        case "111":
            self.showComingSoonAlert()
        case "222":
            self.showComingSoonAlert()
        case "333":
            switch viewModel?.getAuthorizationType() {
            case.login:
                viewModel?.setupAuthorizationType(.registration)
                setupAuthorizationType()
            
            case.registration:
                viewModel?.setupAuthorizationType(.login)
                setupAuthorizationType()

            case .none:
                print("❤️ ")
            }
        case "444":
            viewModel?.showForgotPassword()
        default:
            print("")
            
        }
    }
}
