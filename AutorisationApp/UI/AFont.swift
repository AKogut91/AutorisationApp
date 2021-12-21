//
//  AFont.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 20.12.2021.
//

import Foundation
import UIKit

struct AFont {
    
    enum FontStyle: String {
        case Bold
        case Regular
        case Normal
            
        }
    
    enum FontSize: CGFloat {
        case s0 = 0.0
        case s12 = 12
        case s14 = 14
        case s28 = 28
    }
    

    func style(fontStyle: FontStyle, size: FontSize) -> UIFont {
        let name = "Helvetica Neue-\(fontStyle.rawValue)"
        var font: UIFont!
        
        switch fontStyle {
        case .Bold:
            font = UIFont(name: name, size: size.rawValue) ?? UIFont(name: name, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
        case .Regular:
            font = UIFont(name: name, size: size.rawValue) ?? UIFont(name: name, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
        case .Normal:
            font = UIFont(name: name, size: size.rawValue) ?? UIFont(name: name, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
        }
        return font
    }
}
