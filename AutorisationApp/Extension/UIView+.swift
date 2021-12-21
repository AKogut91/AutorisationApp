//
//  UIView+.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation
import UIKit

extension UIView {

    func addBorder(_ width: CGFloat = 1, color: UIColor = .black, cornerRadius: CGFloat = 4) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.cornerRadius = cornerRadius
    }

}
