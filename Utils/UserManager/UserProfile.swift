//
//  UserProfile.swift
//  clw
//
//  Created by apple on 2016/10/25.
//  Copyright © 2016年 Datang. All rights reserved.
//

import UIKit

final class UserProfile {
    
    static let shared = UserProfile()
   
//    override init() {
//        
//    }
    
    var headURL: URL?
    var nickName: String?
    var image: UIImage?
    var name: String?
    var gender: String?
    var birthDay: Date?
    var introduction: String?
    var alertOn = false {
        didSet {
            if !oldValue {
                shakeOn = false
            }
        }
    }
    var shakeOn = false
    var nickname: String?
    var location: String?
    var phoneNumber: String?
    var job: String?
}

final class Login: NSObject  {
    
    static let shared = Login()
    
    var username: String?
    var password: String?
}
