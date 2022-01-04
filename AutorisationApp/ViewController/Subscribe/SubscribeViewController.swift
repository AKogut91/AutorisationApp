//
//  SubscribeViewController.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 30.12.2021.
//

import UIKit

class SubscribeViewController: BaseViewController {

   private enum SubscribeType {
        case header
        case info
        case price
        case button
    }
    
    private let sections: [SubscribeType] = [.header, .info, .price, .button]
    private lazy var subscribeHeaderTableViewCell = SubscribeHeaderTableViewCell()
    private lazy var subscribePriceTableViewCell = SubscribePriceTableViewCell()
    private lazy var subscribeInfoTableViewCell = SubscribeInfoTableViewCell()
    private lazy var subscribeButtonTableViewCell = SubscribeButtonTableViewCell()
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: SubscribeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SubscribeViewModel()
        setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.backgroundColor = .clear
        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.registerCell(whith: subscribeHeaderTableViewCell.className)
        tableView.registerCell(whith: subscribePriceTableViewCell.className)
        tableView.registerCell(whith: subscribeInfoTableViewCell.className)
        tableView.registerCell(whith: subscribeButtonTableViewCell.className)
    }
}

extension SubscribeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .header:
            return 1
        case .info:
            return viewModel?.getModel().subcribeInfo.count ?? 0
        case .price:
            return viewModel?.getModel().subcribePrice.count ?? 0
        case .button:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .header:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: subscribeHeaderTableViewCell.className, for: indexPath) as? SubscribeHeaderTableViewCell else {
                return UITableViewCell()}
            return cell
        case .info:
            guard  let cell = tableView.dequeueReusableCell(withIdentifier: subscribeInfoTableViewCell.className, for: indexPath) as? SubscribeInfoTableViewCell else {
                return UITableViewCell()}
            cell.configure(viewModel?.getModel().subcribeInfo[indexPath.row].infoText ?? "")
            return cell
        case.price:
            guard  let cell = tableView.dequeueReusableCell(withIdentifier: subscribePriceTableViewCell.className, for: indexPath) as? SubscribePriceTableViewCell else {
                return UITableViewCell()}
            cell.configure(viewModel?.getModel().subcribePrice[indexPath.row])
            return cell
        case .button:
            guard  let cell = tableView.dequeueReusableCell(withIdentifier: subscribeButtonTableViewCell.className, for: indexPath) as? SubscribeButtonTableViewCell else {
                return UITableViewCell()}
            cell.delegate = self
            return cell
        }
    }
}

extension SubscribeViewController: SubscribeButtonDelegate {
    func restoreSubscribe() {
        self.showComingSoonAlert()
    }
    
    func subscribe() {
        self.dismiss(animated: true, completion: nil)
    }

}
