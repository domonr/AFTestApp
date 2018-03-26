//
//  TopViewController.swift
//  AFTestApp
//
//  Created by Domon on 2018/03/23.
//  Copyright © 2018年 af.test.app. All rights reserved.
//

import UIKit

protocol TopViewControllerProtocol: class, ErrorAlertShowable {
    func updateTableView()
    func pushVC(vc: UIViewController)
}

final class TopViewController: UIViewController {
    
    // MARK: IB
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Parameter
    
    private lazy var presenter: TopPresenter = {
        return TopPresenter(vc: self)
    }()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.registerCell(for: self.tableView)
        self.presenter.getUsers(searchWord: "AndFactory")
    }
}

// MARK: - API
extension TopViewController: TopViewControllerProtocol {
    
    func updateTableView() {
        self.tableView.reloadData()
    }
    
    func pushVC(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - TableView
extension TopViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.presenter.cellForRowAt(indexPath: indexPath, for: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.presenter.didSelectRowAt(indexPath: indexPath)
    }
}

// MARK: - SearchBar
extension TopViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.presenter.getUsers(searchWord: searchBar.text ?? "AndFactory")
    }
}
