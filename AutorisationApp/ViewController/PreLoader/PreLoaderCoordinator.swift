//
//  PreLoaderCordinator.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 28.12.2021.
//

import Foundation
import UIKit

protocol PreLoaderNavigationCordinator {
    func pop()
    func presentWelcomeVC()
}

class PreLoaderCoordinator: Coordinator, PreLoaderNavigationCordinator {
    
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("❤️ start")
        let preloaderViewController = PreLoaderViewController()
        let preloadVC = preloaderViewController.instance.instantiateViewController(withIdentifier: preloaderViewController.className) as? PreLoaderViewController
        preloadVC?.viewModel = PreloadViewModel(coordinator: self)
        guard let presentvc = preloadVC else {
            return }
        self.navigationController.setViewControllers([presentvc], animated: true)
    }
    
    func pop() {
        self.navigationController.popViewController(animated: true)
    }
    
    func presentWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        let welcomeVC = welcomeViewController.instance.instantiateViewController(withIdentifier: welcomeViewController.className) as? WelcomeViewController
        welcomeVC?.viewModel = WelcomeViewModel(coordinator: self)
        guard let presentvc = welcomeVC else {
            return }
        self.navigationController.pushViewController(presentvc, animated: true)
    }
    
    func presentAuthorizationCoordinator(type: AuthorizationType) {
        let coordinator = AuthorizationCoordinator(navigationController: navigationController)
        coordinator.start(type: type)
    }
}
