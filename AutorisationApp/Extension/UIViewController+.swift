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
    
    func alertError(_ title: String) {
        let controller = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        weak var weakController: UIAlertController? = controller
        self.present(weakController!, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            weakController?.dismiss(animated: true, completion: nil)
        }
    }
    
    func showComingSoonAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.alertError("Coming Soon")
        }
    }
}


