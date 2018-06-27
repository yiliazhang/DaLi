//
//  LaunchViewController.swift
//  clw
//
//  Created by apple on 2016/10/13.
//  Copyright © 2016年 Datang. All rights reserved.
//

import UIKit
class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var imageName = ""
        
        switch (SCREEN_WIDTH, SCREEN_HEIGHT) {
            case (320, 480):
                imageName = "640960"
            case (320, 568):
                imageName = "6401136"
                
            case (375, 667):
                imageName = "7501334"
            case (414, 736):
                imageName = "12422208"
            default:
                imageName = "12422208"
                break
        }
        let image = UIImage(named: imageName)!
        let bgImageView = UIImageView(image: image)
        bgImageView.contentMode = .scaleAspectFit
        view.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.center.equalTo(self.view)
            make.height.greaterThanOrEqualTo(self.view)
        }
        
        // Do any additional setup after loading the view.
        
       
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let currentUser = YILSettings.shared[kCurrentUser],
            let userPassword = YILSettings.shared[kUserPassword] else {
                let controller = SignInViewController()
                let navigationController = NavigationController(rootViewController: controller)
                resetRootViewController(navigationController)
                return;
        }
        User.login(currentUser, password: userPassword, autoLogin: true, rememberPassword: true, completionHandler: { (response) in
            if response.resultCode == .success {
                resetRootViewController(TabBarController())
            } else {
                let controller = SignInViewController()
                let navigationController = NavigationController(rootViewController: controller)
                resetRootViewController(navigationController)
            }
        })
    }
}
