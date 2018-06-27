//
//  TabViewController.swift
//  clw
//
//  Created by apple on 2016/10/13.
//  Copyright © 2016年 Datang. All rights reserved.
//

import UIKit
extension UIViewController {
    public class func initializeOnceMethod() {
        UITabBar.appearance().tintColor = .appTintColor
        // Do any additional setup after loading the view.
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.appTintColor], for: .selected)

    }
}
class TabBarController: UITabBarController {
    var lastSelectedIndex = 0
    
    struct Constants {
        static let kCenterButtonHidden = "com.bjdv.clw.kCenterButtonHidden"
        static let kCenterButtonNotHidden = "com.bjdv.clw.kCenterButtonNotHidden"
    }
    
    let items: [(viewController: UIViewController, title: String, imageName: String)] = {
//        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! HomeViewController
//        let healthyViewController = UIStoryboard(name: "Healthy", bundle: nil).instantiateInitialViewController() as! CarHealthViewController
//        return [(homeViewController, "首页", "首页"),
//                (ServiceViewController(), "服务", "服务"),
//                (BaseViewController(), "仪表", "仪表"),
//                (BDrivingViewController(), "骑行", "骑行"),
//                (healthyViewController, "健康", "健康")]
        return [(HomeViewController(), "首页", "首页"),(TradeHallViewController(), "交易大厅", "交易大厅"),(MineViewController(), "我的", "我的"),]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        items.forEach { (viewController, title, imageName) in
            viewController.title = title
            let nav = NavigationController(rootViewController: viewController)
            nav.tabBarItem.image = UIImage(named: imageName)!
            self.addChild(nav)
        }
        
    }
    /**
     *  *iOS中可以直接调用某个对象的消息方式有两种
     
     *1.performSelector:withObject;
     
     *2.NSInvocation
     *
     */
    //使用这里的代码也是oK的。 这里利用 NSInvocation 调用 对象的消息
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.current.setValue(UIInterfaceOrientationMask.portrait.rawValue, forKey: "orientation")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTabBarChildController(_ controller: UIViewController, title: String, image imageStr: String, selectImage selectImageStr: String) {
        let nav = NavigationController(rootViewController: controller)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(named: imageStr)!
        //        nav.tabBarItem.image = UIImage(named: imageStr)!.withRenderingMode(.alwaysOriginal)
        //        nav.tabBarItem.selectedImage = UIImage(named: selectImageStr)!.withRenderingMode(.alwaysOriginal)
        //        nav.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSAttributedString.KeyforegroundColor: RGBA(74, 74, 74, 1.0)], for: .normal)
        //        nav.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSAttributedString.KeyforegroundColor: RGBA(255, 200, 0, 1.0)], for: .selected)
        self.addChild(nav)
    }
}

