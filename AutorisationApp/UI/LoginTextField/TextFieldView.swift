//
//  TextFieldView.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation
import UIKit

enum TextFieldType {
    case email, password, comfirmPassword, errorEmail, errorPassword, errorComfirmPassword
}

class TextFieldView: UIView {
    
    @IBOutlet weak var backView: AView!
    @IBOutlet weak var textfield: ATextField!
    
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
            
        } else {
            print("Error init -> \(String(describing: TextFieldView.self)) ")
        }
    }
    
    func style(type: TextFieldType, delegate: UITextFieldDelegate) {
        switch type {
        case .email:
            backView.style(.contentBody)
            textfield.style(as: .email, for: delegate, with: "Email")
        case .password:
            backView.style(.contentBody)
            textfield.style(as: .password, for: delegate, with: "Password")
        case .comfirmPassword:
            backView.style(.contentBody)
            textfield.style(as: .newPassword, for: delegate, with: "Comfirm Password")
        case.errorEmail:
            backView.style(.erroContentBody)
            textfield.style(as: .email, for: delegate)
        case.errorPassword:
            backView.style(.erroContentBody)
            textfield.style(as: .password, for: delegate)
        case.errorComfirmPassword:
            backView.style(.erroContentBody)
            textfield.style(as: .newPassword, for: delegate)
        }
    }
}
