//
//  UITableViewCell+.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 04.01.2022.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last ?? ""
    }
    
}
