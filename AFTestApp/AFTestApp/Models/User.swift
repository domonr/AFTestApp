//
//  User.swift
//  AFTestApp
//
//  Created by Domon on 2018/03/23.
//  Copyright © 2018年 af.test.app. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var name: String
    var imageURL: String
    var url: String
    var type: Type
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case imageURL = "avatar_url"
        case url = "html_url"
        case type
    }
}

// MARK: - Enum
extension User {
    
    enum `Type`: String, Codable {
        case user = "User"
        case org = "Organization"
    }
}
