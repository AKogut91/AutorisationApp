//
//  TextFieldView.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation
import UIKit

enum TextFieldType {
    case email, password, comfirmPassword
    
    func textForPlaceholder() -> String {
            switch self {
                case .email:
                    return "Email"
                case .password:
                    return "Password"
                case .comfirmPassword:
                    return "Comfirm Password"
            }
        }
    
}

class TextFieldView: UIView {

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
    
    func showHideErrorTextFieldBorder(error: Bool) {
    
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
    
    func style(type: TextFieldType, delegate: UITextFieldDelegate) {
        switch type {
        case .email:
            textfield.style(as: .email, for: delegate,
                            placeholder: type.textForPlaceholder(),
                            backgroundColor: AColor.backgroundTextField,
                            borderColor: .clear, cornerRadius: .regular)
            
        case .password:
            textfield.style(as: .password, for: delegate,
                            placeholder: type.textForPlaceholder(),
                            backgroundColor: AColor.backgroundTextField,
                            borderColor: .clear, cornerRadius: .regular)
            
        case .comfirmPassword:
            textfield.style(as: .password, for: delegate,
                            placeholder: type.textForPlaceholder(),
                            backgroundColor: AColor.backgroundTextField,
                            borderColor: .clear, cornerRadius: .regular)
        }
        
    }
}
