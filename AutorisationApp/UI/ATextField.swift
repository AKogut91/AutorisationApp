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
    private let kHideButtonHeight: CGFloat = 30.0
    private let kDefaultFontSize: CGFloat = 20.0
    private let kMinimumFontSize: CGFloat = 14.0
    
    // MARK: - Declarations
    
    enum ATextFieldType {
        case email
        case password
    }
    
    enum ATextFieldCornerRadius: CGFloat {
        case none = 0.0
        case regular = 8.0
        case large = 20.0
    }
    
    // MARK: - Accessible methods
    
    
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    
    func style(as type: ATextFieldType,
               for delegate: UITextFieldDelegate?,
               placeholder: String? = nil,
               backgroundColor: UIColor = .clear,
               borderColor: UIColor = .clear,
               cornerRadius: ATextFieldCornerRadius) {
        
        configure(for: delegate, with: placeholder)
        
        self.backgroundColor = backgroundColor
        self.addBorder(1.0, color: UIColor.clear, cornerRadius: cornerRadius.rawValue)
        
        switch type {
        case .password:
            addHideButton()
            self.isSecureTextEntry = true
            self.clearButtonMode = .never
            self.returnKeyType = .go
            self.keyboardType = .URL
            self.autocorrectionType = .no
            self.textContentType = .oneTimeCode
            
        case .email:
            self.returnKeyType = .go
            self.keyboardType = .emailAddress
            self.textContentType = .oneTimeCode
            self.autocorrectionType = .no
        }
    }
    
    // MARK: - Helper methods
    
    func isShowErorr(_ isVisible: Bool) {
        if isVisible {
            self.addBorder(1.0, color: AColor.backgroundErrorText, cornerRadius: ATextFieldCornerRadius.regular.rawValue)
        } else {
            self.addBorder(1.0, color: UIColor.clear, cornerRadius: ATextFieldCornerRadius.regular.rawValue)
        }
    }
    
    private func configure(for delegate: UITextFieldDelegate?, with placeholder: String?) {
        self.delegate = delegate
        self.placeholder = placeholder
        self.clearButtonMode = .whileEditing
        self.borderStyle = .none
        self.textColor = .white
        self.tintColor = .white
        self.minimumFontSize = kMinimumFontSize
        self.adjustsFontSizeToFitWidth = true
    }
    
    private func addHideButton() {
        hideButton = AButton(frame: CGRect(x: .zero, y: .zero,
                                            width: kHideButtonHeight,
                                            height: kHideButtonHeight))
        hideButton?.styleAsImage(with: UIImage(named: "eye"))
        hideButton?.addTarget(self, action: #selector(hideButtonTap), for: .touchUpInside)
        
        
        hideButton?.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 0)
        hideButton?.frame = CGRect(x: CGFloat(self.frame.size.width - 40), y:5, width:25, height:25.0)
        
        rightView = hideButton
        rightViewMode = .always
    }
    
    // MARK: - @objc methods
    
    // Show and hide button in right corent textfield
    @objc private func hideButtonTap() {
        isSecureTextEntry.toggle()
        let newImage: UIImage? = isSecureTextEntry == true ? UIImage(named: "eye") : UIImage(named: "eye_puprupe")
            UIView.animate(withDuration: 0.33) { [weak self] in
            self?.hideButton?.styleAsImage(with: newImage)
        }
    }
    
}

