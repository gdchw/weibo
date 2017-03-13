//
//  WBBaseViewController.swift
//  新浪微博
//
//  Created by GDC on 17/2/7.
//  Copyright © 2017年 GDC. All rights reserved.
//

import UIKit

// 面试： OC 中支持多继承吗？如果不支持，如何替代？ 答案：使用协议替代
// Swift 的写法类似于多继承
//class WBBaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
// Swift 中，利用 extension 可以把‘函数’按照功能分类管理，便于阅读和维护
// 注意：
// 1. extension 中不能有属性
// 2. extension 不能重写‘父类’非扩展的方法！重写父类方法，是子类的职责

class WBBaseViewController: UIViewController {
    
    /// 用户登录标记
    var userLogin = false
    
    /// 访客视图信息
    var visitorInfoDic: [String: String]?
    
    
    /// 表格视图 - 如果没有登录，就不创建
    var tableView: UITableView?
    /// 刷新控件
    var refreshControl: UIRefreshControl?
    
    /// 上拉刷新标记
    var isPullUp = false
    
    
    /// 自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.screenWidth, height: 64))
    /// 自定义的导航条目 - 以后设置设置导航栏内容 统一使用 navItem
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
    }

    /// 重写 title 的 didSet 方法
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    /// 加载数据 - 具体的实现由子类负责
    func loadData() {
        // 如果子类不实现任何方法，默认关闭刷新控件
        refreshControl?.endRefreshing()
    }
}

// MARK: - 登录注册的方法
extension WBBaseViewController {

    @objc fileprivate func login() {
        print("登录")
    }
    
    @objc fileprivate func register() {
        print("注册")
    }
    
}

// MARK: - 设置界面
extension WBBaseViewController {
    
    fileprivate func setupUI() {
        view.backgroundColor = UIColor().cr_random
        
        // 取消自动缩进 - 如果隐藏了导航栏，会缩进 20 个像素
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavigationBar()
        
        userLogin ? setupTableView() : setupVisitorView()
    }
    
    /// 设置表格视图
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)

        /// 添加视图到导航视图下方
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        // 设置数据源&代理 -> 目的：子类直接实现数据源方法
        tableView?.dataSource = self
        tableView?.delegate = self
        
        // 设置内容缩进
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height,
                                               left: 0,
                                               bottom: tabBarController?.tabBar.bounds.height ?? 49,
                                               right: 0)
    
        // 设置刷新控件
        // 1.实例化控件
        refreshControl = UIRefreshControl()
        
        // 2.添加到表格视图
        tableView?.addSubview(refreshControl!)
        
        // 3.添加监听方法
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    /// 设置访客视图
    private func setupVisitorView() {
        let visitorView = WBVieitorView(frame: view.bounds)
        
        view.insertSubview(visitorView, belowSubview: navigationBar)
        
        visitorView.visitorInfo = visitorInfoDic
        
        // 添加访客视图的监听方法
        visitorView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        visitorView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(register))
        navItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(login))
    }
    
    /// 创建导航条
    private func setupNavigationBar() {

        view.addSubview(navigationBar)
        // 2.将 Item 设置给 bar
        navigationBar.items = [navItem]
        navigationBar.barTintColor = UIColor(red: 231, green: 231, blue: 231, alpha: 0.8)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        navigationBar.tintColor = UIColor.orange
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate 数据源代理
extension WBBaseViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    // 基类只是准备方法，子类负责具体的实现
    // 子类的数据源方法不需要 super
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 只是保证没有语法错误
        return UITableViewCell()
    }
    
    /// 在显示最后一行的时候，做上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // 1.判断 indexPath 是否为最后一行
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        
        if row < 0 || section < 0 {
            return
        }
        
        // 行数
        let count = tableView.numberOfRows(inSection: section)
        
        // 如果是最后一行，同时没有开始上拉刷新
        if row == (count - 1) && !isPullUp {
            print("上拉刷新")
            isPullUp = true
            
            // 开始刷新
            loadData()
        }
        
    }
}
