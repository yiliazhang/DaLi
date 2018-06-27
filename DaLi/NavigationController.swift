//
//  NavigationController.swift
//  clw
//
//  Created by apple on 2016/10/18.
//  Copyright © 2016年 Datang. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override var shouldAutorotate: Bool {
        return (self.topViewController?.shouldAutorotate)!
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController!.supportedInterfaceOrientations
    }
}
extension NavigationController {
//    public class func initializeOnce() {
//
//        let navigationBarAppearance = UINavigationBar.appearance()
//
//        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize18)]
//        navigationBarAppearance.tintColor = UIColor.white//设置tintColor
//        navigationBarAppearance.barTintColor = .appTintColor
//        navigationBarAppearance.shadowImage = UIImage()
//
//        //            let appearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationController.self])
//        //            appearance.setTitleTextAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: fontSize18)], for: UIControlState())
//
//
//        //            appearance.setTitleTextAttributes([NSAttributedString.KeyforegroundColor: UIColor.white,
//        //                                               NSFontAttributeName: UIFont.boldSystemFont(ofSize: fontSize18)], for: UIControlState())
//        //            appearance.tintColor = UIColor.white//设置tintColor
//        //            appearance.barTintColor = .appTintColor
//    
//    }

}
