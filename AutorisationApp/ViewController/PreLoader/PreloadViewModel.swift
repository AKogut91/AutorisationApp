//
//  PreloadViewModel.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 28.12.2021.
//

import Foundation

protocol PreloadViewModelType: AnyObject {
    func presentWelcomVC()
}

class PreloadViewModel: PreloadViewModelType {
    
    private var coordinator: PreLoaderNavigationCordinator?
    private var network: NetworkService?
    
    init(coordinator: PreLoaderNavigationCordinator) {
        self.coordinator = coordinator
    }

    // MARK: - Coordinator
    func presentWelcomVC() {
        self.coordinator?.presentWelcomeVC()
    }
    
}
