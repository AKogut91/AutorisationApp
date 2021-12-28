//
//  StoryboardInitializable.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 27.12.2021.
//

import Foundation
import UIKit

 protocol StoryboardInitializable: UIViewController {
    // MARK: - Fields
    
    static var storyboardIdentifier: String { get }
}

 extension StoryboardInitializable {
    // MARK: - Accessible methods
    
    static var storyboardIdentifier: String { String(describing: Self.self) }
    
}
     
