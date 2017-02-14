//
//  UIButton+Extension.swift
//  新浪微博
//
//  Created by GDC on 17/2/10.
//  Copyright © 2017年 GDC. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// 遍历构造函数
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - color: 标题颜色
    ///   - highlightedColor: 标题高亮颜色
    ///   - backgroundImage: 背景图片
    convenience init(title: String = "", fontSize: CGFloat = 14, color: UIColor = UIColor.clear, highlightedColor: UIColor = UIColor.clear, backgroundImage: String = "") {
//        
        self.init()
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        self.setTitleColor(color, for: .normal)
        self.setTitleColor(highlightedColor, for: .highlighted)
        
        self.setBackgroundImage(UIImage(named: backgroundImage), for: .normal)
        
        self.sizeToFit()
        
    }
}
