//
//  UIButton+.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 17.12.2021.
//

import Foundation
import UIKit

extension UIButton {

    func leftImage(image: UIImage, padding: CGFloat, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        contentHorizontalAlignment = .left
        let availableSpace = bounds.inset(by: contentEdgeInsets)
        let availableWidth = availableSpace.width - imageEdgeInsets.right - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: availableWidth / 2, bottom: 0, right: 0)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0)
    }
    
}
