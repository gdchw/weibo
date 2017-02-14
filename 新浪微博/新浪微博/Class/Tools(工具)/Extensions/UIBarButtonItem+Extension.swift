//
//  UIBarButtonItem+Extension.swift
//  新浪微博
//
//  Created by GDC on 17/2/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    
    /// convenience 遍历构造函数
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - fontSize: 字体大小 默认 16 号
    ///   - target: target
    ///   - action: action
    ///   - isBack: 是否为返回按钮
    convenience init(title: String, fontSize: CGFloat = 16, target: AnyObject?, action: Selector, isBack: Bool = false) {
        let btn: UIButton = UIButton.cr_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        if isBack {
            let imageName = "navigationbar_back_withtext"
            btn.setImage(UIImage(named: imageName), for: .normal)
            btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        }
        
        btn.sizeToFit()
        
        // 遍历构造函数要调用 self.init() 实例化 UIBarButtonItem
        self.init(customView:btn)
    }
}
