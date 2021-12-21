//
//  HomeViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 20.12.2021.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func dismisActions(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
