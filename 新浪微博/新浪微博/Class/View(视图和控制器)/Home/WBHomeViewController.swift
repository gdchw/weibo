//
//  WBHomeViewController.swift
//  新浪微博
//
//  Created by GDC on 17/2/7.
//  Copyright © 2017年 GDC. All rights reserved.
//

import UIKit

// 定义全局常量，尽量设置 private 修饰，负责哪里都可以访问
private let cellId = "cellId"

class WBHomeViewController: WBBaseViewController {

    /// 微博数据组
    lazy fileprivate var statusList = [String]()

    /// 加载数据
    override func loadData() {
        
        print("开始加载数据\(WBNetWorkManager.shard)")
        
        // 模拟‘延时’加载数据 -> dispatch_after
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            for i in 0..<15 {
                if self.isPullUp {
                    // 将数据追加到底部
                    self.statusList.append("上拉\(i)")
                }else{
                    // 将数据插入数组的顶部
                    self.statusList.insert(i.description, at: 0)
                }
                
            }
            
            print("刷新表格")
            
            // 结束刷新控件
            self.refreshControl?.endRefreshing()
            self.isPullUp = false
            // 刷新表格
            self.tableView?.reloadData()
        }
        
        
    }
    
    /// 显示好友
    @objc func showFriends() {
        
        let vc = WBDemoViewController()
        
        // push 的侗族是 nav 做的
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - 表格数据源方法,具体的数据源方法实现，不需要 super
extension WBHomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1.取 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for:indexPath)
        
        // 2.设置 cell
        cell.textLabel?.text = statusList[indexPath.row]
        
        // 3.返回 cell
        return cell
    }
    
    
}

// MARK: - 设置界面
extension WBHomeViewController {
    
    /// 重写父类的方法
    override func setupTableView() {
        super.setupTableView()
        
        // 设置导航栏
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriends))
        
        // 注册原型 cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    

    
}
