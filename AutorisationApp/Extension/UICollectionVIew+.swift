//
//  UICollectionVIew+.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 24.12.2021.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCell(whith id: String) {
        self.register(UINib(nibName: id, bundle: nil), forCellWithReuseIdentifier: id)
    }
    
    func getCellId(whith id: String) -> String {
        return id
    }
    
}
