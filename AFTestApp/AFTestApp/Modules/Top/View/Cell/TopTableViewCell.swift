//
//  TopTableViewCell.swift
//  AFTestApp
//
//  Created by Domon on 2018/03/26.
//  Copyright © 2018年 af.test.app. All rights reserved.
//

import Foundation
import UIKit

final class TopTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var mainImageView: UIImageView!
    
    @IBOutlet private weak var typeLabel: UILabel!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    func setData(user: User) {
        self.mainImageView.imageFromServerURL(urlString: user.imageURL)
        self.typeLabel.text = user.type.rawValue
        self.nameLabel.text = user.name
    }
}

extension TopTableViewCell {
    
    static var cellName: String {
        return "TopTableViewCell"
    }
}
