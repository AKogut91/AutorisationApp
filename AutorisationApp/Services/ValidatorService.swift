//
//  ValidatorService.swift
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


enum EmailError: LocalizedError {
    case error

    var errorDescription: String? {
        switch self {
        case .error:
            return "Wrong e-mail or format"
        }
    }
}


enum PassworError: LocalizedError {
    case error

    var errorDescription: String? {
        switch self {
        case .error:
            return "Your password should maintain at least one letter"
        }
    }
}

enum ComfirmError: LocalizedError {
    case error

    var errorDescription: String? {
        switch self {
        case .error:
            return "Your password should maintain at least one letter"
        }
    }
}

enum ValidatorType: Error {
    case email
    case password
    case comfirmPassword
}

struct AValidator: Validator {
    
    private var validatorType: ValidatorType!
    
    mutating func style(_ type: ValidatorType) {
        validatorType = type
    }
    
    
    func validate(_ input: String?) throws {
        
        switch validatorType {
        case .email:
            Logger.init().Log("email")
            guard let text = input else {
                throw EmailError.error
            }
            
            if !text.isEmail {
                throw EmailError.error
            }
        
        case .password, .comfirmPassword:
            Logger.init().Log("password")
            guard let text = input else {
                throw PassworError.error
            }
            
            if !text.isValidPassword() {
                throw PassworError.error
            }
            
        case .none:
            print("")
        }
    }
    
    func validatePassword(password: String, comfirmPassword: String) throws {
        if !password.elementsEqual(comfirmPassword) {
            throw ComfirmError.error
        }
    }
    
}
