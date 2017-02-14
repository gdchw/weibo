//
//  Bundle+Extensions.swift
//  新浪微博
//
//  Created by GDC on 17/2/7.
//  Copyright © 2017年 GDC. All rights reserved.
//

import Foundation

extension Bundle {
    
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
