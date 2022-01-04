//
//  AuthorizationCoordinator.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 28.12.2021.
//

import Foundation
import UIKit

protocol AuthorizationNafigationCoordinator: AnyObject {
    func pop()
    func presentForgotPassword()
    func presentSubscribe()
}

class AuthorizationCoordinator: Coordinator, AuthorizationNafigationCoordinator {
        
    private var storyboard: UIStoryboard?
    
    unowned let navigationController: UINavigationController
    private var authorizationViewController: AuthorizationViewController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.authorizationViewController = AuthorizationViewController()
        self.storyboard = authorizationViewController?.instance
    }
    
    func pop() {
        self.navigationController.popViewController(animated: true)
    }
    
    func start(type: AuthorizationType) {
        guard let authorizationVC = storyboard?.instantiateViewController(withIdentifier: authorizationViewController?.className ?? "") as? AuthorizationViewController else {
            return }
        
        authorizationVC.viewModel = AuthorizationViewModel.init(type: type, coordinator: self)
        self.navigationController.pushViewController(authorizationVC, animated: true)
    }

    func presentForgotPassword() {
        let forgorPasswordViewController = ForgotPasswodViewController()
        let forgorPasswordVC = storyboard?.instantiateViewController(withIdentifier: forgorPasswordViewController.className) as? ForgotPasswodViewController
    
        guard let presentvc = forgorPasswordVC else {
            return }
        presentvc.viewModel = ForgotPasswordViewModel.init(coordinator: self)
        self.navigationController.pushViewController(presentvc, animated: true)
        
    }
    
    func presentSubscribe() {
        SubscribeCoordinator(navigationController: navigationController).start()
    }
    
}

extension AuthorizationCoordinator {
    func start() {
        print("")
    }
}
