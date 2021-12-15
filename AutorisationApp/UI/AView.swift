//
//  AView.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation
import UIKit

class AView: UIView {
    
    private enum CornerRadius: CGFloat {
        case none = 0.0
        case regular = 8.0
        case large = 20.0
    }
    
   private enum FillBehavior {
        case filled
        case translucent
        case outlined
        case outlinedWarining
    }
    
    enum ViewStyle {
        case contentBody, erroContentBody
        
    }
    
    func style(_ style: ViewStyle) {
        switch style {
        case.contentBody:
            configure(as: .filled, with: AColor.backgroundTextField, cornerRadius: .regular)
        case.erroContentBody:
            configure(as: .outlinedWarining, with: AColor.backgroundTextField, cornerRadius: .regular)
        }
        
        func configure(as style: FillBehavior,
                               with color: UIColor = .clear,
                               cornerRadius: CornerRadius = .none,
                               isBlurred: Bool = false,
                               isLightBlurred: Bool = false) {
            switch style {
            case .filled:
                backgroundColor = color
                layer.borderColor = UIColor.clear.cgColor
                layer.borderWidth = 1.0
            case .translucent:
                backgroundColor = .clear
                layer.borderColor = UIColor.clear.cgColor
                layer.borderWidth = 1.0
            case .outlined:
                backgroundColor = .clear
                layer.borderColor = color.cgColor
                layer.borderWidth = 1.0
            case .outlinedWarining:
                setupStyle(backgroundColor: color, borderColor: AColor.backgroundErrorText, borderWidth: 1.0)
            }
            
            layer.cornerRadius = cornerRadius.rawValue
            clipsToBounds = true
        }
         
        func setupStyle(backgroundColor: UIColor, borderColor: UIColor, borderWidth: Double) {
            self.backgroundColor = backgroundColor
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = borderWidth
        }
        
    }
}
