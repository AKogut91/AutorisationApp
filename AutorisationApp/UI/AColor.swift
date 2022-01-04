//
//  AColor.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation
import UIKit

private let lightBackground = UIColor.init(hex: "F6F7F9")
private let darkBackground = UIColor.init(hex: "161824")

private let lightTextViewBackground = UIColor.init(hex: "FFFFFF")
private let darkTextViewBackground = UIColor.init(hex: "2B2F46")

private let lightError = UIColor.init(hex: "FF5271")
private let darkError = UIColor.init(hex: "FF5271")

private let lightTopLabel = UIColor.init(hex: "161824")
private let darkTopLabel = UIColor.white

private let purple = UIColor.init(hex: "6151CB")

private let preloadDarkColor1 = UIColor.init(hex: "161824")
private let preloadDarkColor2 = UIColor.init(hex: "594EC9")
private let preloadDarkColor3 = UIColor.init(hex: "8F63D6")
private let preloadDarkColor4 = UIColor.init(hex: "BA89A8")

private let preloadLightColor1 = UIColor.init(hex: "FFFFFF")
private let preloadLightColor2 = UIColor.init(hex: "A1C1FF")
private let preloadLightColor3 = UIColor.init(hex: "B7D4FF")
private let preloadLightColor4 = UIColor.init(hex: "FFFFFF")

private let colorViewDark = UIColor.init(hex: "2B2F46")
private let colorViewLight = UIColor.init(hex: "FFFFFF")

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

    static var topTextColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { traitCollection -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .light, .unspecified: return lightTopLabel
                case .dark: return darkTopLabel
                @unknown default: fatalError()
                }
            })
        } else { return lightTopLabel }
    }

    static var purpleColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { traitCollection -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .light, .unspecified: return purple
                case .dark: return purple
                @unknown default: fatalError()
                }
            })
        } else { return purple }
    }
    
    static var preloadColor1: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { traitCollection -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .light, .unspecified: return preloadLightColor1
                case .dark: return preloadDarkColor1
                @unknown default: fatalError()
                }
            })
        } else { return preloadLightColor1 }
    }
    
    static var preloadColor2: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { traitCollection -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .light, .unspecified: return preloadLightColor2
                case .dark: return preloadDarkColor2
                @unknown default: fatalError()
                }
            })
        } else { return preloadLightColor2 }
    }
    
    static var preloadColor3: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { traitCollection -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .light, .unspecified: return preloadLightColor3
                case .dark: return preloadDarkColor3
                @unknown default: fatalError()
                }
            })
        } else { return preloadLightColor3 }
    }
    
    static var preloadColor4: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { traitCollection -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .light, .unspecified: return preloadLightColor4
                case .dark: return preloadDarkColor4
                @unknown default: fatalError()
                }
            })
        } else { return preloadLightColor4 }
    }
    
    static var view: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { traitCollection -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .light, .unspecified: return colorViewLight
                case .dark: return colorViewDark
                @unknown default: fatalError()
                }
            })
        } else { return colorViewLight }
    }
    
}
