//
//  ForgotPasswordViewModel.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 28.12.2021.
//

import Foundation

class ForgotPasswordViewModel {

    var coordinator: AuthorizationCoordinator?
    
    init(coordinator: AuthorizationCoordinator) {
        self.coordinator = coordinator
    }

    func pop() {
        self.coordinator?.pop()
    }

}
