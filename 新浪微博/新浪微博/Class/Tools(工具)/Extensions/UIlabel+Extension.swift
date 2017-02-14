//
//  UIlabel+Extension.swift
//  新浪微博
//
//  Created by GDC on 17/2/10.
//  Copyright © 2017年 GDC. All rights reserved.
//

import UIKit

extension UILabel {

    convenience init(text: String, fontSize: CGFloat = 14, textColor: UIColor = .black, backgroundColor: UIColor = .clear, numberOfLine: Int = 0) {
        
        self.init()
        
        self.text = text
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.numberOfLines = numberOfLine
        
        self.sizeToFit()
        
    }
}
