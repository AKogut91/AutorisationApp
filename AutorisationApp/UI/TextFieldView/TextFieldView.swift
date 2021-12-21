//
//  TextFieldView.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation
import UIKit

protocol TextFieldViewDelegate: AnyObject {
    func shouldReturn(_ sender: TextFieldView) -> Bool
}

enum TextFieldType {
    case email
    case password
    case comfirmPassword(TextFieldView)
}

class TextFieldView: UIView, UITextFieldDelegate {

    @IBOutlet weak private var textfield: ATextField!
    @IBOutlet weak private var errorLabel: UILabel!
    private var validator: Validator?
    private var textFieldType: TextFieldType?
    private var linkedPasswordTextField: TextFieldView?

    weak var delegate: TextFieldViewDelegate?

    // MARK: - Lifecycle methods

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {
        let bundle = Bundle.init(for: TextFieldView.self)
        if let viewToAdd = bundle.loadNibNamed(String(describing: TextFieldView.self), owner: self, options: nil), let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            // UI Color
            contentView.backgroundColor = .clear
            textfield.backgroundColor = .clear
            errorLabel.isHidden = true
        } else {
            print("Error init -> \(String(describing: TextFieldView.self)) ")
        }
    }

    func style(type: TextFieldType, placeholder: String = "") {
        self.textFieldType = type
        switch type {
        case .email:
            textfield.style(as: .email, for: self,
                            placeholder: placeholder,
                            backgroundColor: AColor.backgroundTextField,
                            borderColor: .clear, cornerRadius: .regular)
            setupLabel()
            validator = EmailValidator()

        case .password:
            textfield.style(as: .password, for: self,
                            placeholder: placeholder,
                            backgroundColor: AColor.backgroundTextField,
                            borderColor: .clear, cornerRadius: .regular)
            setupLabel()
            validator = PasswordValidator()

        case .comfirmPassword(let textView):
            self.linkedPasswordTextField = textView
            textfield.style(as: .password, for: self,
                            placeholder: placeholder,
                            backgroundColor: AColor.backgroundTextField,
                            borderColor: .clear, cornerRadius: .regular)
            setupLabel()
            validator = PasswordValidator()
        }

    }

    private func setupLabel() {
        errorLabel.textColor = AColor.backgroundErrorText
        errorLabel.font = AFont.init().style(fontStyle: .normal, size: .s12)
    }

    // MARK: - Delegate

   func textFieldDidBeginEditing(_ textField: UITextField) {
       UIView.animate(withDuration: 0.33) { [unowned self] in
           errorLabel.isHidden = true
           errorLabel.alpha = 0
           textfield.isShowErorr(false)
       }
   }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {

        guard let currentValidator = validator else {return}
        do {

            guard let textFieldText = textfield.text else { return }

            try currentValidator.validate(textFieldText)

            if linkedPasswordTextField != nil {
                guard let pass = linkedPasswordTextField?.textfield.text else { return }

                if let passwordValidator = currentValidator as? PasswordValidator {
                    try passwordValidator.validatePassword(password: pass, comfirmPassword: textfield.text ?? "")
                }
            }

            UIView.animate(withDuration: 0.33) { [unowned self] in
                errorLabel.isHidden = true
                errorLabel.alpha = 0
                textfield.isShowErorr(false)
            }

        } catch let error as LocalizedError {
            errorLabel.text = error.errorDescription

            UIView.animate(withDuration: 0.33) { [unowned self] in
                errorLabel.isHidden = false
                errorLabel.alpha = 1
                textfield.isShowErorr(true)
            }

        } catch {
            // Catch any other errors
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return self.delegate?.shouldReturn(self) ?? true
    }

    @discardableResult override func becomeFirstResponder() -> Bool {
        return textfield.becomeFirstResponder()
    }

    @discardableResult override func resignFirstResponder() -> Bool {
        return textfield.resignFirstResponder()
    }

}
