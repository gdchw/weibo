//
//  WBNetWorkManager.swift
//  新浪微博
//
//  Created by GDC on 2017/3/13.
//  Copyright © 2017年 GDC. All rights reserved.
//

import UIKit


enum WBHTTPMethod {
    case GET
    case POST
}

/// 网络管理工具
class WBNetWorkManager: AFHTTPSessionManager {

    static let shard = WBNetWorkManager()
    
    func request(method: WBHTTPMethod, URLString: String, parameters: Any?, completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()) {
        
        let success = {(task: URLSessionDataTask, json:Any?) -> () in
            
            completion(json, true)
        }
        
        let failure = {(task: URLSessionDataTask?, error: Error) -> () in
            
            print("网络请求错误\(error)")
            completion(nil, false)
        }
        
        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }else {
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
        
        
    }
}
