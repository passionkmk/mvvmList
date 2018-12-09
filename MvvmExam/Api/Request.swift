//
//  Request.swift
//  MvvmExam
//
//  Created by 김민구 on 07/12/2018.
//  Copyright © 2018 KimMinKu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias SuccessCompletionHandler = (_ json: JSON) -> Void
typealias FailureCompletionHandler = (_ error: Error?, _ message: String?) -> Void

public class Request {
    class func search(with keyword: String, success: @escaping  SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
        let url = Networking.baseURLString + Networking.Path.search.rawValue
        let parameters: [String: String] = ["term": keyword, "limit": "30", "country": "KR", "media": "software", "entity": "software", "offset": "1"]
        Alamofire.request(url,
                          method: .get,
                          parameters: parameters)
            .validate()
            .responseJSON { (result) in
                if let error = result.error {
                    failure(error, error.localizedDescription)
                    return
                }
                
                guard let data = result.data else {
                    failure(nil, "Invisible response data.")
                    return
                }
                
                let json = JSON(data)
                success(json["results"])
                return
        }
    }
}
