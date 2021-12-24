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
        case bold = "Bold"
        case regular = "Regular"
        case normal = "Normal"
    }

    enum FontSize: CGFloat {
        case s12 = 12
        case s14 = 14
        case s28 = 28
        case s32 = 32
    }

    func style(fontStyle: FontStyle, size: FontSize) -> UIFont? {
        let name = "Helvetica"
        var font: UIFont?

        switch fontStyle {
        case .bold:
            font = UIFont(name: name + "-\(fontStyle.rawValue)", size: size.rawValue) ?? UIFont(name: name, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
        case .regular:
            font = UIFont(name: name + "-\(fontStyle.rawValue)", size: size.rawValue) ?? UIFont(name: name, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
        case .normal:
            font = UIFont(name: name, size: size.rawValue) ?? UIFont(name: name, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
        }
        return font
    }
}
