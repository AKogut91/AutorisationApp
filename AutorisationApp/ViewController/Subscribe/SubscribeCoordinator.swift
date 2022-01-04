//
//  SubscribeCoordinator.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 04.01.2022.
//

import Foundation
import UIKit

class SubscribeCoordinator: Coordinator {
    
    private var storyboard: UIStoryboard?
    
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let subscribeViewController = SubscribeViewController()
        let subscribeVC = subscribeViewController.instance.instantiateViewController(withIdentifier: subscribeViewController.className) as? SubscribeViewController
    
        guard let presentvc = subscribeVC else {
            return }
        presentvc.modalPresentationStyle = .fullScreen
        self.navigationController.present(presentvc, animated: true)
    }
}
