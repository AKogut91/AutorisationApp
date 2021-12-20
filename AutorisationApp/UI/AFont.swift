//
//  AFont.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 20.12.2021.
//

import Foundation
import UIKit

enum FontType {
    case top
    case header
    case footer
    case mormal
    
    private enum FontSize: CGFloat {
        case none = 0.0
        case normal = 12
        case regular = 14
        case large = 28
        
    }
    
    func getFont() -> UIFont {
        let name = "Helvetica Neue"
        switch self {
        case .top:
            let size = FontSize.large.rawValue
            let font = UIFont(name: name , size: size) ?? UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
            return font
        case .header:
            let size = FontSize.regular.rawValue
            let font = UIFont(name: name , size: size) ?? UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
            return font
        case .footer:
            let size = FontSize.regular.rawValue
            let font = UIFont(name: name , size: size) ?? UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
            return font
        case .mormal:
            let size = FontSize.normal.rawValue
            let font = UIFont(name: name , size: size) ?? UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
            return font
        }
    }
}

