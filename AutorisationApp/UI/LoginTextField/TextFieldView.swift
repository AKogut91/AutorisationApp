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
    @IBOutlet weak private var errorLabel: ALabel!
    private var validator : AValidator?
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
            validator = AValidator.init()
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
            errorLabel.style(type: .error)
            validator?.style(.email)
            
        case .password:
            textfield.style(as: .password, for: self,
                            placeholder: placeholder,
                            backgroundColor: AColor.backgroundTextField,
                            borderColor: .clear, cornerRadius: .regular)
            errorLabel.style(type: .error)
            validator?.style(.password)
            
        case .comfirmPassword(let textView):
            self.linkedPasswordTextField = textView
            textfield.style(as: .password, for: self,
                            placeholder: placeholder,
                            backgroundColor: AColor.backgroundTextField,
                            borderColor: .clear, cornerRadius: .regular)
            errorLabel.style(type: .error)
            validator?.style(.comfirmPassword)
        }
        
    }
    
    func getTextFromTextFied() -> String? {
        return textfield.text
    }
    
    // MARK: - Animation Border in TextField
    private func showHideErrorTextFieldBorder(error: Bool) {
        
        if error {
            UIView.animate(withDuration: 0.3) {
                self.textfield.showHideBorder(showing: true)
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.textfield.showHideBorder(showing: false)
            }
        }
    }
    
    // MARK: - Delegate
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        guard let valid = validator else {return}
        do {

            guard let textFieldText = textfield.text else { return }
            
            //if textFieldText.isEmpty {
            //    return
            //}
            
            try valid.validate(textFieldText)
            
            if linkedPasswordTextField != nil {
                guard let pass = linkedPasswordTextField?.textfield.text else { return }
                try valid.validatePassword(password: pass, comfirmPassword: textfield.text ?? "")
                
            } 
            
            UIView.animate(withDuration: 0.33) { [unowned self] in
                errorLabel.isHidden = true
                errorLabel.alpha = 0
                showHideErrorTextFieldBorder(error: false)
            }
            
        } catch let error as LocalizedError {
            errorLabel.text = error.errorDescription
            
            UIView.animate(withDuration: 0.33) { [unowned self] in
                errorLabel.isHidden = false
                errorLabel.alpha = 1
                showHideErrorTextFieldBorder(error: true)
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

