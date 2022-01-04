//
//  UITableView+.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 04.01.2022.
//

import Foundation
import UIKit

extension UITableView {

    func registerCell(whith id: String) {
        self.register(UINib(nibName: id, bundle: nil), forCellReuseIdentifier: id)
    }
    
    func getCellId(whith id: String) -> String {
        return id
    }
    
}
