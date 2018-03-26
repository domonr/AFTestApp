//
//  Error.swift
//  AFTestApp
//
//  Created by Domon on 2018/03/23.
//  Copyright © 2018年 af.test.app. All rights reserved.
//

import Foundation

enum AppError: Error {
    case noData
    case failDecode
    case urlException
}

extension AppError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .noData:
            return "サーバからデータが返ってきません。GitHubのAPIが動作しているか確認して下さい！"
        case .failDecode:
            return "デコードに失敗しました"
        case .urlException:
            return "不正なURLです。URLを確認してください。"
        }
    }
}
