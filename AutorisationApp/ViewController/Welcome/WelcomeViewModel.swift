//
//  WelcomeViewModel.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 28.12.2021.
//

import Foundation

protocol WelcomeViewModelType {
    func showLoginAuthorization()
    func showRegistrationAuthorization()
}

class WelcomeViewModel: WelcomeViewModelType {
    
    private var coordinator: PreLoaderCoordinator?
    
    init(coordinator: PreLoaderCoordinator?) {
        self.coordinator = coordinator
    }
    
    func showLoginAuthorization() {
        self.coordinator?.presentAuthorizationCoordinator(type: .login)
    }
    
    func showRegistrationAuthorization() {
        self.coordinator?.presentAuthorizationCoordinator(type: .registration)
    }

}
