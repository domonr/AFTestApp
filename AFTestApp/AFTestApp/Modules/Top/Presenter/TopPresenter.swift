//
//  TopPresenter.swift
//  AFTestApp
//
//  Created by Domon on 2018/03/23.
//  Copyright © 2018年 af.test.app. All rights reserved.
//

import Foundation
import UIKit

final class TopPresenter {
    
    private weak var vc: TopViewControllerProtocol!
    private var users: Users?
    
    init(vc: TopViewControllerProtocol) {
        self.vc = vc
    }
}

// MARK: - API
extension TopPresenter {
        
    func getUsers(searchWord: String) {
        Users.get(searchWord: searchWord, success: { users in
            self.users = users
            self.vc.updateTableView()
        }, fail: { e in
            
        })
    }
}

// MARK: - TableView
extension TopPresenter {
    
    func registerCell(for tableView: UITableView) {
        tableView.register(UINib(nibName: "TopTableViewCell", bundle: nil), forCellReuseIdentifier: TopTableViewCell.cellName)
    }
    
    func numberOfRowsInSection() -> Int {
        return self.users?.items.count ?? 0
    }
    
    func cellForRowAt(indexPath: IndexPath, for tableView: UITableView) -> UITableViewCell {
        guard let user = self.users?.items[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: TopTableViewCell.cellName) as? TopTableViewCell else {
                return UITableViewCell()
        }
        cell.setData(user: user)
        
        return cell
    }
}
