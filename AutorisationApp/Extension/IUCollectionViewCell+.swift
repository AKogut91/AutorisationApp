//
//  IUCollectionViewCell+.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 24.12.2021.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last ?? ""
    }
    
}
