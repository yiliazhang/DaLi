//
//  AppDelegate.swift
//  DaLi
//
//  Created by apple on 2018/6/26.
//  Copyright © 2018年 bjdv. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import UserNotifications

func resetRootViewController(_ controller: UIViewController) {
//    guard let window = UIApplication.shared.keyWindow else {
//        assert(false, "参数错误")
//        return
//    }
//    let image = UIImage.screenShot()
//    let imageView = UIImageView(image: image)
//    imageView.frame = UIScreen.main.bounds
//    controller.view.addSubview(imageView)
//    window.rootViewController = controller
//    UIView.animate(withDuration: 0.5, delay: 0, animations: {() -> Void in
//        imageView.alpha = 0
//    }, completion: {(finished: Bool) -> Void in
//        imageView.removeFromSuperview()
//    })
}

class AppInitializer {
    ///应用启动设置
    class func logOut() {
//        if let block = NetworkHelper.authorizeFailed {
//            block()
//        }
        //TODO: - 清理数据
    }

    class func onAppStart() {
        IQKeyboardManager.shared.enable = true
//        TabBarController.initializeOnce()
        //        NavigationController.initializeOnce()
        /// token 失效处理
//        NetworkHelper.authorizeFailed = {
//            AppInitializer.clearUserData()
//            UIApplication.shared.keyWindow?.rootViewController = SignInViewController()
//        }

        //        if #available(iOS 9.0, *) {
        //            let appearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        //            appearance.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: fontSize16)], for: UIControlState())
        //        } else {
        // Fallback on earlier versions
        //        }
        ///检测更新
        //        if let _ = HostManager.host,
        //            let _ = HostManager.port {
//        UpdateManager.update(HostManager.hostConfig.updateName)
        //        }
    }

    ///创建缓存文件夹
    class func createCacheDir() {
//        if !FileManager.default.fileExists(atPath: USER_CACHE_DIR) {//创建配置文件目录
//            do{
//                try FileManager.default.createDirectory(atPath: USER_CACHE_DIR, withIntermediateDirectories: true, attributes: nil)
//            } catch {
//                fatalError("创建用户信息目录失败")
//            }
//        }
    }
    ///清理缓存文件夹
    class func clearCacheDir() {
//        if FileManager.default.fileExists(atPath: USER_CACHE_DIR) {//创建配置文件目录
//            do{
//                try FileManager.default.removeItem(atPath: USER_CACHE_DIR)
//                createCacheDir()
//            } catch {
//                fatalError("清理用户信息失败")
//            }
//        }
    }

    ///清理缓存文件夹
    class func clearUserData() {
//        YILSettings.shared[kCurrentUser] = nil
    }

    class func tabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()

        func setTabBarChildController(_ viewControllerClass: UIViewController.Type, title: String, image imageStr: String, selectedImage: String) {
            let viewController = viewControllerClass.init()
            let nav = UINavigationController(rootViewController: viewController)
            nav.tabBarItem.title = title
            nav.tabBarItem.image = UIImage(named: imageStr)
            nav.tabBarItem.selectedImage = UIImage(named: selectedImage)
            //        nav.tabBarItem.image = UIImage(named: imageStr)!.withRenderingMode(.alwaysOriginal)
            //        nav.tabBarItem.selectedImage = UIImage(named: selectImageStr)!.withRenderingMode(.alwaysOriginal)
            //        nav.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: RGBA(74, 74, 74, 1.0)], for: .normal)
            //        nav.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: RGBA(255, 200, 0, 1.0)], for: .selected)
            tabBarController.addChild(nav)
        }
        setTabBarChildController(HomeViewController.self, title: "首页", image: "icon_sy", selectedImage: "icon_sypre")
        setTabBarChildController(TradeHallViewController.self, title: "交易大厅", image: "icon_work", selectedImage: "icon_workpre")
        setTabBarChildController(MineViewController.self, title: "我的", image: "icon_xiaoxi", selectedImage: "icon_xiaoxipre")
        return tabBarController
    }

    ///
    class func rootViewController() -> UIViewController {
        //        if let _ = HostManager.host,
        //            let _ = HostManager.port {
        //            return AppInitializer.tabBarController()
        //        } else {
        return SignInViewController()
//                }
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppInitializer.onAppStart()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = AppInitializer.rootViewController()
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

