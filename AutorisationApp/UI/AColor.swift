//
//  AColor.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation
import UIKit

fileprivate let lightBackground = UIColor.white
fileprivate let darkBackground = UIColor.init(hex: "161824")

fileprivate let lightTextViewBackground = UIColor.white
fileprivate let darkTextViewBackground = UIColor.init(hex: "2B2F46")

fileprivate let lightError = UIColor.white
fileprivate let darkError = UIColor.init(hex: "FF5271")


enum AColor {
    // MARK: - Fields

    static var background: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { traitCollection -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .light, .unspecified: return lightBackground
                case .dark: return darkBackground
                @unknown default: fatalError()
                }
            })
        } else { return lightBackground }
    }
    
    static var backgroundTextField: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { traitCollection -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .light, .unspecified: return lightTextViewBackground
                case .dark: return darkTextViewBackground
                @unknown default: fatalError()
                }
            })
        } else { return lightTextViewBackground }
    }
    
    static var backgroundErrorText: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { traitCollection -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .light, .unspecified: return lightError
                case .dark: return darkError
                @unknown default: fatalError()
                }
            })
        } else { return lightError }
    }
}
