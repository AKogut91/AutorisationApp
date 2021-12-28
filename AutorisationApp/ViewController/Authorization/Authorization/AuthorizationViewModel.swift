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

class AuthorizationViewModel: AuthorizationViewModelType {
        
    private var coordinator: AuthorizationCoordinator?
    
    init(coordinator: AuthorizationCoordinator) {
        print("❤️ AuthorizationViewModel")
        self.coordinator = coordinator
        print("❤️ coordinator -> \(coordinator)")
    }
    
    func showForgotPassword() {
        print("❤️ showForgotPassword -> ")
        self.coordinator?.presentForgotPassword()
    }
}
