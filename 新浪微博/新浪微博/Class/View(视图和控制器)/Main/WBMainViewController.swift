//
//  WBMainViewController.swift
//  新浪微博
//
//  Created by GDC on 17/2/7.
//  Copyright © 2017年 GDC. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildControllers()
        setupComposeButton()
        
    }

    // 撰写按钮
    lazy var composeButton: UIButton = UIButton.cr_imageButton("tabbar_compose_icon_add",backgroundImageName: "tabbar_compose_button")
    
    /**
        portrait:  竖屏
        landscape: 横屏
        - 使用代码控制设备方向，好处在需要横屏的时候单独处理
        — 设置支持的方向之后，当前的控制器及子控制器都会遵守这个方向
        - 如果播放视频，通常都是 modal 展示的
     */
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    // MARK: - 监听方法
    /// 撰写微博
    // FIXME: 没有实现
    // @objc 允许这个函数在运行时通过 OC 的消息机制被调用
    func composeStatus() {
        print("撰写微博")
        // 测试方向旋转
        let vc = UIViewController()
        
        vc.view.backgroundColor = UIColor().cr_random
        
        let nav = UINavigationController(rootViewController: vc)
        
        present(nav, animated: true, completion: nil)
        
    }
}

/** extension 类似于 OC 中的 分类，在 Swift 中还可以用来切分代码块
  * 可以把相近功能的函数，放在一个 extension 中
  * 便于维护
  * 注意：和 OC 的分类一样，extension 中不能定义属性
  */
// MARK: - 设置界面
extension WBMainViewController {
    

    /// 设置撰写按钮
    fileprivate func setupComposeButton() {
        tabBar.addSubview(composeButton)
        
        // 计算按钮的高度
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1
        
        // CGRectInset 正数向内缩进 负数向外扩展
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        // 按钮监听方法
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
        
    }
    
    /// 设置所有子控制器
    fileprivate func setupChildControllers() {
    
        // 获取沙盒 json 路径
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
        // 加载 data
        var data = NSData(contentsOfFile: jsonPath)
        
        // 判断 data 是否有内容，如果有则加载，没有就说明本地沙盒没有文件
        if data == nil {
            // 从 bundle 加载 data
            let path  = Bundle.main.path(forResource: "main.json", ofType: nil)
            data = NSData(contentsOfFile: path!)
        }
        
        // data 一定会有一个内容， 反序列化
        // 反序列化转化成数组
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: Any]] else {
            return
        }
        
        
        
        
        // 现在的很多应用程序中，界面的创建都依赖网络的 json
//        let array = [
//            ["clsName": "WBHomeViewController","title": "首页","imageName": "home", "visitorInfo": ["imageName": "", "message": "关注一些人，回这里看看有什么惊喜"]],
//            ["clsName": "WBMessageViewController","title": "消息","imageName": "message_center", "visitorInfo": ["imageName": "visitordiscover_image_message", "message": "登录后，别人评论你的微博，发给您的消息，都会在这里收到通知"]],
//            ["clsName": "xxxx"],
//            ["clsName": "WBDiscoverViewController","title": "发现","imageName": "discover", "visitorInfo": ["imageName": "visitordiscover_image_message", "message": "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过"]],
//            ["clsName": "WBProfileViewController","title": "我","imageName": "profile", "visitorInfo": ["imageName": "visitordiscover_image_profile", "message": "登录后，你的微博、相册、个人资料会显示在这里，展示给别人"]]
//        ]
        
        // 测试数据格式是否正确 转换成 plist 数据更加直观
//        (array as NSArray).write(toFile: "/users/mac/Desktop/demo.plist", atomically: true)
        // 数组 －> json 序列化
//        let data = try! JSONSerialization.data(withJSONObject: array, options: [.prettyPrinted])
//        (data as NSData).write(toFile: "/Users/mac/Desktop/main.json", atomically: true)
        
        
        
        var arrayM = [UIViewController]()
        for dict in array! {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
        
    }
    
    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典[clsName, title, imageName]
    /// - Returns: 子控制器
    private func controller(dict: [String: Any]) -> UIViewController {

        // 1. 取得字典内容
        guard let clsName = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? WBBaseViewController.Type,
            let visitorDict = dict["visitorInfo"] as? [String: String]
        
            else {
            
                return UIViewController()
        }
        
        // 2. 创建视图控制器
        // 1> 将 clsName 转换成cls
        let vc = cls.init()
        
        vc.title = title
        
        // 设置控制器的访客视图信息
        vc.visitorInfoDic = visitorDict
        
        // 3. 设置图像
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        // 4. 设置 TabBar 的标题字体
        vc.tabBarItem.setTitleTextAttributes(
            [NSForegroundColorAttributeName: UIColor.orange],
            for: .highlighted)
        // 系统默认的 12 号字，修改字体大小，要设置 Normal 的字体大小
        vc.tabBarItem.setTitleTextAttributes(
            [NSFontAttributeName: UIFont.systemFont(ofSize: 12)],
            for: UIControlState(rawValue: 0))
        
        // 实例化导航控制器的时候，会调用 push 方法将 rootVC 压栈
        let nav = WBNavigationController(rootViewController: vc)
        
        
        return nav
    }
}













