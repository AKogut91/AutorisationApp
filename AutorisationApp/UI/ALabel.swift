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
        case top
        case header
        case fotter
        case error
        case none
        
    }
    
    func style(type: ALabelType = .none, text: String = "") {
        self.numberOfLines = 0
        switch type {
        case .top:
            self.text = text
            configuration(textColor: AColor.topTextColor, font: .top)
        case .header:
            self.text = text
            configuration(textColor: AColor.topTextColor, font: .header)
        case .fotter:
            self.text = text
            configuration(textColor: AColor.topTextColor, font: .mormal)
        case .error:
            self.text = text
            configuration(textColor: AColor.backgroundErrorText, font: .footer)
            self.setMargins()
        case .none:
            print("")
        }
        
    }
    
    private func configuration(textColor: UIColor, font: FontType) {
        self.textColor = textColor
        self.font = font.getFont()
    }
    
    func showHideErrorLabel(isHidden: Bool, alpha: Int) {
        self.isHidden = isHidden
        self.alpha = CGFloat(alpha)
        // MARK: - Add Font Class
    }
}
