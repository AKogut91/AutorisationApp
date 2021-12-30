//
//  AFont.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 20.12.2021.
//

import Foundation
import UIKit

private let familyName = "Poppins"

enum AFonts: String {
    case regular = "Regular"
    case bold = "Bold"
    case semiBold = "SemiBold"
    
    enum FontSize: CGFloat {
        case s12 = 12
        case s14 = 14
        case s18 = 18
        case s28 = 28
        case s32 = 32
        case s35 = 35
    }
    
    func size(_ size: FontSize) -> UIFont {
        if let font = UIFont(name: fullFontName, size: size.rawValue) {
            return font
        }
        fatalError("Font '\(fullFontName)' does not exist.")
    }
    
    fileprivate var fullFontName: String {
        return rawValue.isEmpty ? familyName : familyName + "-" + rawValue
    }
}
