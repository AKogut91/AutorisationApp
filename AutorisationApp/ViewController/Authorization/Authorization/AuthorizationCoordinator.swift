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
}

class AuthorizationCoordinator: Coordinator, AuthorizationNafigationCoordinator {

    private var storyboard: UIStoryboard?
    
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pop() {
        self.navigationController.popViewController(animated: true)
    }
    
    func start() {
        print("❤️ start")
        let authorizationViewController = AuthorizationViewController()
        self.storyboard = authorizationViewController.instance
            
        let authorizationVC = storyboard?.instantiateViewController(withIdentifier: authorizationViewController.className) as? AuthorizationViewController
        
        guard let presentvc = authorizationVC else {
            return }
        presentvc.viewModel = AuthorizationViewModel.init(coordinator: self)
        self.navigationController.pushViewController(presentvc, animated: true)
    }
        
    func presentForgotPassword() {
        let forgorPasswordViewController = ForgotPasswodViewController()
        let forgorPasswordVC = storyboard?.instantiateViewController(withIdentifier: forgorPasswordViewController.className) as? ForgotPasswodViewController
    
        guard let presentvc = forgorPasswordVC else {
            return }
        presentvc.viewModel = ForgotPasswordViewModel.init(coordinator: self)
        self.navigationController.pushViewController(presentvc, animated: true)
        
    }
    
}
