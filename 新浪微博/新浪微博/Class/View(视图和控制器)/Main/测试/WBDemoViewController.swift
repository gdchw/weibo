//
//  WBDemoViewController.swift
//  新浪微博
//
//  Created by GDC on 17/2/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置标题
        title = "第 \(navigationController?.childViewControllers.count ?? 0) 页"
    }

    // MARK: - 监听方法
    func nextVC() {
        let vc = WBDemoViewController()
        
        // 继续 push 下一页
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension WBDemoViewController {
    
    override func setupUI() {
        super.setupUI()
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一页", style: .plain, target: self, action: #selector(nextVC))
    }
    
    
    

}
