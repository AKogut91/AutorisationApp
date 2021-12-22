//
//  Validator.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 16.12.2021.
//

import Foundation

protocol Validator {
    func validate(_ input: String?) throws
    func isValid(_ input: String?) -> Bool
}

extension Validator {
    func isValid(_ input: String?) -> Bool {
        do {
            try validate(input)
            return true
        } catch {
            return false
        }
    }
}
