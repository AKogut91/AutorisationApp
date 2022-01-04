//
//  SubscribeInfoTableViewCell.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 30.12.2021.
//

import UIKit

class SubscribeInfoTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }

    func configure(_ data: String) {
        self.infoLabel.text = data
    }
    
}
