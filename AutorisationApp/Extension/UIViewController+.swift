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
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last ?? ""
    }
    
    func alertError(with title: String) {
        let controller = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        weak var weakController: UIAlertController? = controller
        
        if let alertVC = weakController {
            self.present(alertVC, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                weakController?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func showComingSoonAlert() {
        self.alertError(with: "Coming Soon")
    }
    
    var instance: UIStoryboard {
        return UIStoryboard(name: className, bundle: Bundle.main)
    }
    
    // func getVCFromWithStoryboard<T: UIViewController>() -> T where T: UIViewController {
    //    return instance.instantiateViewController(withIdentifier: className) as! T
    // }
}
