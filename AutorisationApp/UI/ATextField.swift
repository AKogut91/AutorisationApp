//
//  ATextField.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation
import UIKit

class ATextField: UITextField {
    
    // MARK: - Fields
    
    private var hideButton: AButton?
    private let kHideButtonHeight: CGFloat = 40.0
    private let kDefaultFontSize: CGFloat = 20.0
    private let kMinimumFontSize: CGFloat = 14.0
    
    // MARK: - Declarations
    
    enum ATextFieldType {
        case email
        case password
        case newPassword
    }
    
    // MARK: - Accessible methods
    
    func style(as type: ATextFieldType,
                      for delegate: UITextFieldDelegate?,
                      with placeholder: String? = nil) {
        configure(for: delegate, with: placeholder)
        switch type {

        case .password:
            addHideButton()
            isSecureTextEntry = true
            clearButtonMode = .never
            returnKeyType = .go
            keyboardType = .default
            if #available(iOS 11.0, *) { textContentType = .password }
            
        case .newPassword:
            addHideButton()
            isSecureTextEntry = true
            clearButtonMode = .never
            returnKeyType = .go
            keyboardType = .default
        
        case .email:
            returnKeyType = .go
            keyboardType = .emailAddress
        }
    }
    
    // MARK: - Helper methods
    
    private func configure(for delegate: UITextFieldDelegate?, with placeholder: String?) {
        self.delegate = delegate
        self.placeholder = placeholder
        autocorrectionType = .no
        clearButtonMode = .whileEditing
        borderStyle = .none
        textColor = .white
        tintColor = .white
        minimumFontSize = kMinimumFontSize
        adjustsFontSizeToFitWidth = true
    }
    
    private func addHideButton() {
        hideButton = AButton(frame: CGRect(x: .zero, y: .zero,
                                            width: kHideButtonHeight,
                                            height: kHideButtonHeight))
        hideButton?.styleAsImage(with: UIImage(named: "eye"))
        hideButton?.addTarget(self, action: #selector(hideButtonTap), for: .touchUpInside)
        
        guard let hideButton = hideButton else { return }
        
        rightView = hideButton
        rightViewMode = .whileEditing
    }
    
    // MARK: - @objc methods
    
    @objc private func hideButtonTap() {
        isSecureTextEntry.toggle()
        let newImage: UIImage? = isSecureTextEntry == true ? UIImage(named: "eye") : UIImage(named: "eye_puprupe")
            UIView.animate(withDuration: 0.33) { [weak self] in
            self?.hideButton?.styleAsImage(with: newImage)
        }
    }
    
    
    
}
