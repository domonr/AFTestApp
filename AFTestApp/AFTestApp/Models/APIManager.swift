//
//  APIManager.swift
//  AFTestApp
//
//  Created by Domon on 2018/03/23.
//  Copyright © 2018年 af.test.app. All rights reserved.
//

import Foundation

struct APIManager {
    
    static func get(url: URL, success: @escaping (Data) -> Void, fail: @escaping (Error) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                fail(error)
                return
            }
            
            guard let data = data else {
                fail(AppError.noData)
                return
            }

            success(data)
        }
        
        defer {
            task.resume()
        }
    }
}
