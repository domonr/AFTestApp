//
//  UIImageView+.swift
//  AFTestApp
//
//  Created by Domon on 2018/03/26.
//  Copyright © 2018年 af.test.app. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func imageFromServerURL(urlString: String, placeholderImage: UIImage? = nil) {
        // URLが不正な値の場合
        guard let url = URL(string: urlString) else {
            self.image = placeholderImage
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            // エラーの場合
            if error != nil {
                self.image = placeholderImage
                return
            }
            // データが空の場合
            guard let data = data else {
                self.image = placeholderImage
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data)
                self.image = image
            })
            
        }).resume()
    }
}
