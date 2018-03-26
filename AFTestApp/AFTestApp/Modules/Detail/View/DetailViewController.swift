//
//  DetailViewController.swift
//  AFTestApp
//
//  Created by Domon on 2018/03/23.
//  Copyright © 2018年 af.test.app. All rights reserved.
//

import UIKit
import WebKit

final class DetailViewController: UIViewController, ErrorAlertShowable {
    
    // MARK: Parameter
    
    var urlString: String = ""
    private let webView = WKWebView(frame: .zero)
    
    // MARK: LifeCycle
    
    override func loadView() {
        super.loadView()
        
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: self.urlString) else {
                self.showErrorAlert(error: AppError.urlException)
                return
        }
        let req = URLRequest(url: url)
        self.webView.load(req)
    }
    
}
