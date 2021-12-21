//
//  String+.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 15.12.2021.
//

import Foundation
import UIKit

extension String {

    private static var numberPattern = Character("0")..."9"
    private static var alphabetPattern = Character("a")..."z"

    func isValidPassword() -> Bool {
        return 0...8 ~= self.count &&
        self.contains { String.numberPattern ~= $0 } &&
        lowercased().self.contains { String.alphabetPattern ~= $0 }
    }

    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

}
