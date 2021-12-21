//
//  EmailValidator.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 21.12.2021.
//

import Foundation

struct EmailValidator: Validator {

    private enum EmailError: LocalizedError {
        case incorrectFormat
        case empty

        var errorDescription: String? {
            switch self {
            case .incorrectFormat:
                return "Wrong e-mail or format"
            case .empty:
                return "Please add text to field"
            }
        }
    }

    func validate(_ input: String?) throws {

        guard let text = input else {
            throw EmailError.empty
        }

        if text.isEmpty {
            throw EmailError.empty
        } else if !text.isEmail {
            throw EmailError.incorrectFormat
        }
    }
}
