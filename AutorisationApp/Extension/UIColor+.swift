//
//  UIColor+.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        var rColor: CGFloat = 0.0
        var gColor: CGFloat = 0.0
        var bColor: CGFloat = 0.0
        var aColor: CGFloat = 1.0

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        if (cString.count) == 8 {
            rColor = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            gColor = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            bColor = CGFloat((rgbValue & 0x0000FF)) / 255.0
            aColor = CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0

        } else if (cString.count) == 6 {
            rColor = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            gColor = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            bColor = CGFloat((rgbValue & 0x0000FF)) / 255.0
            aColor = CGFloat(1.0)
        }

        self.init(  red: rColor,
                    green: gColor,
                    blue: bColor,
                    alpha: aColor
        )
    } }
