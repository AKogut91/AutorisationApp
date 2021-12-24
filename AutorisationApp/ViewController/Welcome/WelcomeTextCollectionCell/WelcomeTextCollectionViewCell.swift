//
//  WelcomeTextCollectionViewCell.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 24.12.2021.
//

import UIKit

class WelcomeTextCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var footerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabel()
    }

    private func setupLabel() {
        headerLabel.textColor = AColor.topTextColor
        headerLabel.font = AFont().style(fontStyle: .bold, size: .s32)
        
        footerLabel.textColor = AColor.topTextColor
        footerLabel.font = AFont().style(fontStyle: .normal, size: .s14)
    }
    
    func setupHeaderCell(text: String) {
        self.headerLabel.text = text
    }
    
    func setupFooterCell(text: String) {
        self.footerLabel.text = text
    }
}
