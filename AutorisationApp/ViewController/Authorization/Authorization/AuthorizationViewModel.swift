//
//  AuthorizationViewModel.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 28.12.2021.
//

import Foundation

protocol AuthorizationViewModelType: AnyObject {
    func showForgotPassword()
}

enum AuthorizationType {
    case registration
    case login
}

class AuthorizationViewModel: AuthorizationViewModelType {
    
    fileprivate var type: AuthorizationType!
    
    fileprivate var coordinator: AuthorizationCoordinator?
    
    required init(type: AuthorizationType, coordinator: AuthorizationCoordinator) {
        self.type = type
        self.coordinator = coordinator
        
        print("❤️ \(type)")
    }
    
    // MARK: - Coordinator
    
    func getAuthorizationType() -> AuthorizationType {
        return type
    }
    
    func setupAuthorizationType(_ type: AuthorizationType) {
        self.type = type
    }
    
    // MARK: - Coordinator
    
    func showForgotPassword() {
        self.coordinator?.presentForgotPassword()
    }
    
    func pop() {
        self.coordinator?.pop()
    }
    
}
