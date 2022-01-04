//
//  SubscribePriceTableViewCell.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 30.12.2021.
//

import UIKit

class SubscribePriceTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var backView: AView!
    @IBOutlet private weak var monthLabel: UILabel!
    @IBOutlet private weak var monthPriceLabel: UILabel!
    @IBOutlet private weak var monthDetailLabel: UILabel!
    @IBOutlet private weak var mothPriceDetailLabel: UILabel!
    @IBOutlet private weak var selectedIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("❤️ selected -> \(selected)")
        
        if selected {
            self.backView.style(.seletedBody)
            selectedIcon.isHidden = false
        } else {
            self.backView.style(.contentBody)
            selectedIcon.isHidden = true
        }
    }
    
    func configure(_ data: SubcribePrice?) {
        self.monthLabel.text = data?.subcribeMonth ?? ""
        self.monthPriceLabel.text = data?.subcribePrice ?? ""
        self.monthDetailLabel.text = data?.subcribeMonthDetails ?? ""
        self.mothPriceDetailLabel.text = data?.subcribePriceDetails ?? ""
    }
}
