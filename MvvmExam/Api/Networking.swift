//
//  Networking.swift
//  MvvmExam
//
//  Created by 김민구 on 05/12/2018.
//  Copyright © 2018 KimMinKu. All rights reserved.
//

import Foundation

public struct Networking {
    static let timeoutInterval: TimeInterval = 10.0
    static let retryCount: Int = 3
    static let baseURLString: String = "https://itunes.apple.com"
    
    enum notificationName: String {
        case search = "searchResultNotificationName"
    }

    enum Path: String {
        case search = "/search"
    }
    
    private init() {}
}
