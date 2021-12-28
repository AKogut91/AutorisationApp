//
//  AButton.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation
import UIKit

class AButton: UIButton {

    // MARK: - Fields

    override var isEnabled: Bool {
        didSet { alpha = isEnabled ? 1.0 : 0.25 }
    }

    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .white
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([ activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                         activityIndicator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0) ])
        return activityIndicator
    }()

    // MARK: - Declarations

    enum ButtonStyle {
        case standart
        case socialLogin
        case primary
        case attention
    }

    enum SocialButtonStyle: String {
        case apple
        case google
        case none
    }

    enum ButtonCornerStyle: CGFloat {
        case plain = 0.0
        case `default` = 30

    }

    // MARK: - Accessible methods

    func style(buttonStyle: ButtonStyle, buttonCornerStyle: ButtonCornerStyle, text: String?) {
        switch buttonStyle {
        case .standart:
            backgroundColor = AColor.purpleColor
            setTitleColor(.white, for: .normal)
            tintColor = .white
        case .socialLogin:
            backgroundColor = AColor.backgroundTextField
            setTitleColor(AColor.topTextColor, for: .normal)
        case .primary:
            backgroundColor = .white
            setTitleColor(.white, for: .normal)
        case .attention:
            backgroundColor = .white
            setTitleColor(.white, for: .normal)
        }

        layer.cornerRadius = buttonCornerStyle.rawValue
        setTitle(text, for: .normal)
    }

    func styleAsImage(with image: UIImage?) {
        backgroundColor = .clear
        setTitle(nil, for: .normal)
        setImage(image, for: .normal)
        tintColor = .white
    }

    func startIndicating() {
        isEnabled = false
        activityIndicator.startAnimating()
    }

    func stopIndicating() {
        activityIndicator.stopAnimating()
        isEnabled = true
    }

    // MARK: - Helper methods

    func startIndicating(_ action: @escaping () -> Void) {
        isEnabled = false
        activityIndicator.startAnimating()
        action()
    }

}
