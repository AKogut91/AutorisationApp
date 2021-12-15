//
//  ALabel.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 15.12.2021.
//

import Foundation
import UIKit

class ALabel: UILabel {
    
    enum ALabelType {
        case email, password, comfirmPassword
        
        func textForLabel() -> String {
            switch self {
            case .email:
                return "Wrong e-mail or format"
            case .password:
                return "Your password should maintain at least one letter"
            case .comfirmPassword:
                return "Passwords don’t match"
            }
        }
    }

    func style(type: ALabelType) {
        self.text = type.textForLabel()
        self.textColor = AColor.backgroundErrorText
    }
    
    func showHideErrorLabel(isHidden: Bool, alpha: Int) {
        self.isHidden = isHidden
        self.alpha = CGFloat(alpha)
        self.setMargins()
        // MARK: - Add Font Class
        self.font = UIFont(name: "Futura", size: 14)
    }

}
