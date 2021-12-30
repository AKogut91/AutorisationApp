//
//  ForgotPasswdViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 27.12.2021.
//

import UIKit

class ForgotPasswodViewController: BaseViewController, TextFieldViewDelegate {

    @IBOutlet private weak var topLabel: UILabel!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var emailTextField: TextFieldView!
    @IBOutlet private weak var codeTextField: CodeTextFieldView!
    @IBOutlet private weak var passwordTextField: TextFieldView!
    @IBOutlet private weak var comfirmPassTextFIeld: TextFieldView!
    @IBOutlet private weak var saveButton: AButton!
    
    var viewModel: ForgotPasswordViewModel?
    
    private enum VCState {
        case email
        case code
        case password
        case changesSaved
        case none
    }
    
    private var state: VCState = .none {
        willSet {
            setupUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBackButton(isHidden: false)
        self.delegatBaseNavigation = self
        self.setLeftNavButton()
        self.setupTextField()
        self.state = .email
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    
    // MARK: - UI
    private func setupTextField() {
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.comfirmPassTextFIeld.delegate = self
        
        self.emailTextField.alpha = 0
        self.codeTextField.alpha = 0
        self.passwordTextField.alpha = 0
        self.comfirmPassTextFIeld.alpha = 0
        
        self.emailTextField.backgroundColor = .clear
        self.codeTextField.backgroundColor = .clear
        self.passwordTextField.backgroundColor = .clear
        self.comfirmPassTextFIeld.backgroundColor = .clear
        
        self.emailTextField.style(type: .email, placeholder: "Email")
        self.passwordTextField.style(type: .password, placeholder: "Password")
        self.comfirmPassTextFIeld.style(type: .password, placeholder: "Password")
    }
    
    private func setupUI() {
        self.logger.log()
        switch state {
        case .email:
            UIView.animate(withDuration: 0.33) { [unowned self] in
                self.emailTextField.isHidden = true
                self.emailTextField.alpha = 0
                self.codeTextField.isHidden = false
                self.codeTextField.alpha = 1
                self.passwordTextField.isHidden = true
                self.comfirmPassTextFIeld.isHidden = true
                saveButton.style(buttonStyle: .standart, buttonCornerStyle: .default, text: "Continue")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    setupLabels(topText: "Enter verification code", header: "We have sent a verification code to your email.")
                    showLabels(isHidden: false)
                }
            }
        case .code:
            UIView.animate(withDuration: 0.33) { [unowned self] in
                self.emailTextField.isHidden = true
                self.emailTextField.alpha = 0
                self.codeTextField.isHidden = true
                self.codeTextField.alpha = 0
                self.passwordTextField.isHidden = false
                self.comfirmPassTextFIeld.isHidden = false
                self.passwordTextField.alpha = 1
                self.comfirmPassTextFIeld.alpha = 1
                saveButton.style(buttonStyle: .standart, buttonCornerStyle: .default, text: "Sign up")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    setupLabels(topText: "Create a new password", header: "")
                    showLabels(isHidden: false)
                }
            }
        case .password:
            UIView.animate(withDuration: 0.33) { [unowned self] in
                self.emailTextField.isHidden = true
                self.codeTextField.isHidden = true
                self.passwordTextField.isHidden = true
                self.comfirmPassTextFIeld.isHidden = true
                saveButton.style(buttonStyle: .standart, buttonCornerStyle: .default, text: "Log in")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    setupLabels(topText: "Changes saved", header: "Your password is changed")
                    showLabels(isHidden: false)
                }
            }
        case .changesSaved:
            showLabels(isHidden: false)
        case .none:
            setupLabels(topText: "Forgot passwоrd?", header: "Type the email address you registered with and we will send you a letter.")
            self.emailTextField.isHidden = false
            self.emailTextField.alpha = 1
            self.codeTextField.isHidden = true
            self.passwordTextField.isHidden = true
            self.comfirmPassTextFIeld.isHidden = true
            saveButton.style(buttonStyle: .standart, buttonCornerStyle: .default, text: "Sign up")
        }
    }
    
    private func setupLabels(topText: String, header: String) {
        topLabel.text = topText
        topLabel.font = AFonts.semiBold.size(.s28)
        
        headerLabel.text = header
        headerLabel.font = AFonts.regular.size(.s14)
    }
    
    private func showLabels(isHidden: Bool) {
        UIView.animate(withDuration: 0.33) {
            self.topLabel.isHidden = isHidden
            self.headerLabel.isHidden = isHidden
            self.topLabel.alpha = isHidden ? 0 : 1
            self.headerLabel.alpha = isHidden ? 0 : 1
        }
    }
    
    // MARK: - Actions
    
    @IBAction func saveActions(_ sender: Any) {
        switch state {
        case .email:
            emailTextField.endEditing { [weak self] correct  in
                if correct {
                    self?.showLabels(isHidden: true)
                    self?.state = .code
                }
            }
        case .code:
            if codeTextField.getCode().count == 6 {
                showLabels(isHidden: true)
                state = .password
                passwordTextField.becomeFirstResponder()
            } else {
                self.showComingSoonAlert()
            }
        case .password:
            comfirmPassTextFIeld.endEditing { [weak self] correct in
                if correct {
                    self?.showLabels(isHidden: true)
                    self?.state = .changesSaved
                }
            }
        case .changesSaved:
            print("❤️ Save to Server")
            self.showComingSoonAlert()
        case .none:
            showLabels(isHidden: true)
        }
    }
    
    func shouldReturn(_ sender: TextFieldView) -> Bool {
        if let view = self.view.viewWithTag(sender.tag + 1) {
            view.becomeFirstResponder()
        } else {
            sender.resignFirstResponder()
        }
        return false
    }
}

extension ForgotPasswodViewController: BaseNavigationDelegate {
    func navigationBackAction() {
        self.viewModel?.pop()
    }
}
