//
//  ViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak private var topLabel: UILabel!
    @IBOutlet weak private var topLabelFooter: UILabel!
    @IBOutlet weak private var emailTextField: TextFieldView!
    @IBOutlet weak private var passwordTextField: TextFieldView!
    @IBOutlet weak private var comfirmPasswordTextField: TextFieldView!
    @IBOutlet weak private var privatePolicyTextView: ATextView!
    @IBOutlet weak private var singUp: AButton!
    @IBOutlet weak private var signInSocialMediaLabel: UILabel!
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
        topLabel.textColor = AColor.topTextColor
        topLabel.text = "Create account"
        topLabel.font = AFonts.regular.size(.s28)

        topLabelFooter.textColor = AColor.topTextColor
        topLabelFooter.text = "Let’s create an account to save your results and secure your journal."
        topLabelFooter.font = AFonts.regular.size(.s14)

        signInSocialMediaLabel.textColor = AColor.topTextColor
        signInSocialMediaLabel.text = "or sign up with social media account:"
        signInSocialMediaLabel.font = AFonts.regular.size(.s12)
    }

    private func setupTextView() {
        privatePolicyTextView.aTextViewDelegate = self
        loginTextView.aTextViewDelegate = self

        privatePolicyTextView.style(type: .undeline,
                                    text: "By continuing, you agree with Privacy Policy & Terms of Use.")
        privatePolicyTextView.addAttr( AttributesText(text: "Privacy Policy", type: .link, value: "111"))
        privatePolicyTextView.addAttr(AttributesText(text: "Privacy Policy", type: .color, value: AColor.purpleColor))

        privatePolicyTextView.addAttr(AttributesText(text: "Terms of Use.", type: .link, value: "222"))
        privatePolicyTextView.addAttr(AttributesText(text: "Terms of Use.", type: .color, value: AColor.purpleColor))
        privatePolicyTextView.setup()

        loginTextView.style(type: .undeline,
                            text: "Already have an account? Log in")
        loginTextView.addAttr(AttributesText(text: "Log in", type: .link, value: "333"))
        loginTextView.addAttr(AttributesText(text: "Log in", type: .color, value: AColor.purpleColor))
        loginTextView.setup()
    }

    private func setupButton() {
        singUp.style(buttonStyle: .standart, buttonCornerStyle: .default, text: "Sign up")
        singInApple.style(buttonStyle: .socialLogin, buttonCornerStyle: .default, text: "Sign up with Apple")
        singInGoogle.style(buttonStyle: .socialLogin, buttonCornerStyle: .default, text: "Sign up with Google")
    }

    // MARK: - Actions

    @IBAction func singUpActions(_ sender: Any) {
        let homeVC = HomeViewController()
        let homeStoryborad = homeVC.instance.instantiateViewController(withIdentifier: homeVC.className) as? HomeViewController
        guard let presentHome = homeStoryborad else {
            return }
        presentHome.modalPresentationStyle = .fullScreen
        self.present(presentHome, animated: true, completion: nil)
    }

    @IBAction func singUpAppleActions(_ sender: Any) {
        self.showComingSoonAlert()
    }

    @IBAction func singUpGoogleActions(_ sender: Any) {
        self.showComingSoonAlert()
    }
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
    func didSelected(item: String) {
        switch item {
        case "111":
            self.showComingSoonAlert()
        case "222":
            self.showComingSoonAlert()
        case "333":
            self.showComingSoonAlert()
        default:
            print("")

        }
    }
}
