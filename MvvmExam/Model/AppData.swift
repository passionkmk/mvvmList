//
//  AppData.swift
//  MvvmExam
//
//  Created by 김민구 on 04/12/2018.
//  Copyright © 2018 KimMinKu. All rights reserved.
//

import Foundation
import SwiftyJSON

struct AppData {
    let name: String //trackName
    let develeoperName: String //artistName
    let smallThumbnailUrl: String //artworkUrl100
    let largeThumbnailUrl: String //artworkUrl512
    
    init(data: JSON) {
        self.name = data["trackName"].stringValue
        self.develeoperName = data["artistName"].stringValue
        self.smallThumbnailUrl = data["artworkUrl100"].stringValue
        self.largeThumbnailUrl = data["artworkUrl512"].stringValue
    }
}
