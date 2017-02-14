//
//  UIScreen+Extension.swift
//  新浪微博
//
//  Created by GDC on 17/2/9.
//  Copyright © 2017年 GDC. All rights reserved.
//

import Foundation

extension UIScreen {

    /// 屏幕宽
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// 屏幕高
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// 屏幕分辨率
    var scalp: CGFloat {
        return UIScreen.main.scale
    }
    
    
}
