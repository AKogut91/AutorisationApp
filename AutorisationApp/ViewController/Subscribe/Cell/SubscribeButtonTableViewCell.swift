//
//  SubscribeButtonTableViewCell.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 30.12.2021.
//

import UIKit

protocol SubscribeButtonDelegate: AnyObject {
    func restoreSubscribe()
    func subscribe()
}

class SubscribeButtonTableViewCell: UITableViewCell {

    @IBOutlet private weak var restoreButton: UIButton!
    @IBOutlet private weak var subscribeButton: AButton!
    
    weak var delegate: SubscribeButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        restoreButton.tintColor = AColor.purpleColor
        subscribeButton.style(buttonStyle: .standart, buttonCornerStyle: .default, text: "Subscribe")
    }
    
    @IBAction func restoreActions(_ sender: Any) {
        delegate?.restoreSubscribe()
    }
    
    @IBAction func subscribeAction(_ sender: Any) {
        delegate?.subscribe()
    }
}
