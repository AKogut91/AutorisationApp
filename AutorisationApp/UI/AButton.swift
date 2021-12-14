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
        case primary
        case attention
    }
    
     enum ButtonCornerStyle: CGFloat {
        case plain = 0.0
        case `default` = 20.0
    }
    
    // MARK: - Accessible methods
    
     func style(buttonStyle: ButtonStyle, buttonCornerStyle: ButtonCornerStyle, text: String?) {
        switch buttonStyle {
        case .primary:
            backgroundColor = .white
            setTitleColor(.white, for: .normal)
        case .attention:
            backgroundColor = .white
            setTitleColor(.white, for: .normal)
        }
        
        //titleLabel?.font = UIFont.rounded(ofSize: 17, weight: .bold)
        layer.cornerRadius = buttonCornerStyle.rawValue
        setTitle(text, for: .normal)
    }
    
     func styleAsPrimary(with text: String?) {
        layer.cornerRadius = 20
         backgroundColor = .white
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        //titleLabel?.font = UIFont.rounded(ofSize: 17, weight: .bold)
    }
    
     func styleAsSecondary(with text: String?) {
        layer.cornerRadius = 20
         backgroundColor = .white
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
         //titleLabel?.font = UIFont.rounded(ofSize: 17, weight: .bold)
    }
    
     func styleAsText(with text: String?) {
        backgroundColor = .clear
        setTitle(text, for: .normal)
         setTitleColor(.white, for: .normal)
         // titleLabel?.font = UIFont.rounded(ofSize: 17, weight: .bold)
    }
    
     func styleAsList(with text: String?) {
        backgroundColor = .white
        setTitle(text, for: .normal)
         setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .selected)
        setTitleColor(.white, for: .highlighted)
        //titleLabel?.font = UIFont.rounded(ofSize: 17, weight: .bold)
    }
    
     func styleAsPlain(with text: String?) {
         backgroundColor = .white
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        //titleLabel?.font = UIFont.rounded(ofSize: 17, weight: .bold)
        tintColor = .white
    }
    
     func styleAsImage(with image: UIImage?) {
        backgroundColor = .clear
        setTitle(nil, for: .normal)
        setImage(image, for: .normal)
         tintColor = .white
    }
    
     func performIndicated(action: @escaping (@escaping () -> Void) -> Void) {
        startIndicating { [weak self] in action { self?.stopIndicating() }}
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
