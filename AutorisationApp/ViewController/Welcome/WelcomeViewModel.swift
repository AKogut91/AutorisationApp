//
//  WelcomeViewModel.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 28.12.2021.
//

import Foundation

protocol WelcomeViewModelType {
    func showAuthorization()
}

class WelcomeViewModel: WelcomeViewModelType {
    
    private var coordinator: PreLoaderCordinator?
    
    init(coordinator: PreLoaderCordinator?) {
        self.coordinator = coordinator
    }
    
    func showAuthorization() {
        self.coordinator?.presentAuthorizationCoordinator()
    }

}
