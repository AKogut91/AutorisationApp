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
        case outlinedSelected
    }

    enum ViewStyle {
        case contentBody
        case seletedBody

    }

    func style(_ style: ViewStyle) {
        switch style {
        case.contentBody:
            configure(as: .filled, with: AColor.view, cornerRadius: .regular)
        case .seletedBody:
            configure(as: .outlinedSelected, with: AColor.view, cornerRadius: .regular)
        }
    }

    private func configure(as style: FillBehavior,
                           with color: UIColor = .clear,
                           cornerRadius: CornerRadius = .none,
                           isBlurred: Bool = false,
                           isLightBlurred: Bool = false) {
        switch style {
        case .filled:
            setupStyle(backgroundColor: color, borderColor: .clear, borderWidth: 1.0)
        case .translucent:
            setupStyle(backgroundColor: .clear, borderColor: .clear, borderWidth: 1.0)
        case .outlined:
            setupStyle(backgroundColor: color, borderColor: color, borderWidth: 1.0)
        case .outlinedWarining:
            setupStyle(backgroundColor: color, borderColor: AColor.backgroundErrorText, borderWidth: 1.0)
        case.outlinedSelected:
            setupStyle(backgroundColor: color, borderColor: AColor.purpleColor, borderWidth: 1.0)
        }

        layer.cornerRadius = cornerRadius.rawValue
        clipsToBounds = true
    }

    private func setupStyle(backgroundColor: UIColor, borderColor: UIColor, borderWidth: Double) {
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
}
