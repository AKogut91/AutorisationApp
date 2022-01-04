//
//  AppCoordinator.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 28.12.2021.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {

    // All coordinators will be initilised with a navigation controller
    init(navigationController: UINavigationController)

    func start()
}
