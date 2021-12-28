//
//  CodeTextFieldView.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 28.12.2021.
//

import Foundation
import UIKit

class CodeTextFieldView: UIView {
    
    // MARK: - Lifecycle methods

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {
        let bundle = Bundle.init(for: CodeTextFieldView.self)
        if let viewToAdd = bundle.loadNibNamed(String(describing: CodeTextFieldView.self), owner: self, options: nil), let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            contentView.backgroundColor = .clear
        } else {
            print("Error init -> \(String(describing: TextFieldView.self)) ")
        }
    }
}
