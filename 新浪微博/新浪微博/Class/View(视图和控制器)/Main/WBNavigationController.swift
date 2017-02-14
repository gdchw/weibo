//
//  WBNavigationController.swift
//  新浪微博
//
//  Created by GDC on 17/2/7.
//  Copyright © 2017年 GDC. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 隐藏默认的NavigationBar
        navigationBar.isHidden = true
    }

    // MARK: - 重写push方法
    /// 重写push方法
    ///
    /// - Parameters:
    ///   - viewController: 是被 push 的控制器，设置它的左侧的按钮作为返回按钮
    ///   - animated: animated
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        // 如果不是栈底(根)控制器才隐藏，根控制器不需要隐藏
        if childViewControllers.count > 0 {
            // 隐藏底部的 TabBar
            viewController.hidesBottomBarWhenPushed = true
            
            // 判断控制器的类型
            if let vc = viewController as? WBBaseViewController {
                
                var title = "返回"
                
                // 判断控制器的级数，只有一个子控制器的时候，显示栈底控制器的标题
                if childViewControllers.count == 1 {
                    // title 只显示首页的标题
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                // 取出自定义的navItem
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParent), isBack: true)
            }
        }
        
        
        super.pushViewController(viewController, animated: true)
    }
    
    /// pop 返回到上一级控制器
    @objc private func popToParent() {
        popViewController(animated: true)
    }
    


}
