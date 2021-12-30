//
//  CodeTextFieldView.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 28.12.2021.
//

import Foundation
import UIKit

class CodeTextFieldView: UIView, UITextFieldDelegate {
    
    @IBOutlet private weak var one: ATextField!
    @IBOutlet private weak var two: ATextField!
    @IBOutlet private weak var three: ATextField!
    @IBOutlet private weak var four: ATextField!
    @IBOutlet private weak var five: ATextField!
    @IBOutlet private weak var six: ATextField!
    private var arrayTextFields: [ATextField] = []
    
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
        let bundle = Bundle.init(for: CodeTextFieldView.self)
        if let viewToAdd = bundle.loadNibNamed(String(describing: CodeTextFieldView.self), owner: self, options: nil), let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            contentView.backgroundColor = .clear
            arrayTextFields = [self.one, self.two, self.three, self.four, self.five, self.six]
        } else {
            print("Error init -> \(String(describing: TextFieldView.self)) ")
        }
        setupTextField()
    }
    
    private func setupTextField() {
        for textfield in arrayTextFields {
            textfield.style(as: .code,
                             for: self,
                             placeholder: "",
                             backgroundColor: AColor.backgroundTextField,
                             borderColor: AColor.backgroundErrorText,
                             cornerRadius: .regular)
        }
    }
    
    func getCode() -> String {
        let str = arrayTextFields.map({$0.text ?? ""}).joined(separator: "")
        return str
    }
    
    // MARK: - Delegate
    
    private func textFieldShouldSelectNext(_ textField: UITextField) {
        if textField == one {
               two.becomeFirstResponder()
            } else if textField == two {
               three.becomeFirstResponder()
            } else if textField == three {
               four.becomeFirstResponder()
            } else if textField == four {
                five.becomeFirstResponder()
             } else if textField == five {
                 six.becomeFirstResponder()
             } else {
                 six.resignFirstResponder()
             }
    }
    
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.text = ""
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        textField.text = updatedText
        textFieldShouldSelectNext(textField)
        return updatedText.count <= 1
    }
    
}
