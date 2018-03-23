//
//  Users.swift
//  AFTestApp
//
//  Created by Domon on 2018/03/23.
//  Copyright © 2018年 af.test.app. All rights reserved.
//

import Foundation

struct Users: Codable {
    
    var items: [User]
}

// MARK: - API
extension Users {
    
    static func get(searchWord: String = "Andfactory", success: @escaping (Users) -> Void, fail: @escaping (Error) -> Void) {
        let urlString = "https://api.github.com/search/users?q=\(searchWord)"
        let url = URL(string: urlString)!
        
        APIManager.get(url: url, success: { data in
            do {
                let users = try JSONDecoder().decode(Users.self, from: data)
                success(users)
            } catch {
                fail(AppError.failDecode)
            }
        }, fail: fail)
    }
}
