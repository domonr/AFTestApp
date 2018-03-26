//
//  ErrorAlertShowable.swift
//  AFTestApp
//
//  Created by Domon on 2018/03/23.
//  Copyright © 2018年 af.test.app. All rights reserved.
//

import Foundation
import UIKit

protocol ErrorAlertShowable {}

extension ErrorAlertShowable where Self: UIViewController {
    
    func showErrorAlert(error: Error, okAction: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "エラー", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: okAction)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
