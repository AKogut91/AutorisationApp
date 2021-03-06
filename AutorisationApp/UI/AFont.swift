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
        case bold
        case regular
        case normal

        }

    enum FontSize: CGFloat {
        case s12 = 12
        case s14 = 14
        case s28 = 28
    }

    func style(fontStyle: FontStyle, size: FontSize) -> UIFont? {
        let name = "Helvetica Neue-\(fontStyle.rawValue)"
        var font: UIFont?

        switch fontStyle {
        case .bold:
            font = UIFont(name: name, size: size.rawValue) ?? UIFont(name: name, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
        case .regular:
            font = UIFont(name: name, size: size.rawValue) ?? UIFont(name: name, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
        case .normal:
            font = UIFont(name: name, size: size.rawValue) ?? UIFont(name: name, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
        }
        return font
    }
}
