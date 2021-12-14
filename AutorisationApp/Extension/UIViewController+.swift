//
//  UIViewController+.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation
import UIKit

extension UIViewController {
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
