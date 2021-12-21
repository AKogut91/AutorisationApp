//
//  PasswordValidator.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 21.12.2021.
//

import Foundation

struct PasswordValidator: Validator {

    private enum PasswordError: LocalizedError {
        case incorrectPassword
        case passwordDoesntMatch
        case empty

        var errorDescription: String? {
            switch self {
            case .incorrectPassword:
                return "Your password should maintain at least one letter"
            case .passwordDoesntMatch:
                return "Passwords don’t match"
            case .empty:
                return "Please add text to fields"
            }
        }
    }

    func validate(_ input: String?) throws {

        guard let text = input else {
            throw PasswordError.empty
        }

        if text.isEmpty {
            throw PasswordError.empty
        } else if !text.isValidPassword() {
            throw PasswordError.incorrectPassword
        }
    }

    func validatePassword(password: String, comfirmPassword: String) throws {
        if !password.elementsEqual(comfirmPassword) {
            throw PasswordError.passwordDoesntMatch
        }
    }
}
