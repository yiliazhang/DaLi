//
//  UserModel.swift
//  V2ex-Swift
//
//  Created by huangfeng on 1/23/16.
//  Copyright © 2016 Fin. All rights reserved.
//

import UIKit
//import CryptoSwift
import SwiftyJSON

/// 工区
class Area: Codable {
    private enum CodingKeys: CodingKey {
        case areaId
        case areaname
    }
    ///  工区名
    var areaName: String?

    /// 工区
    var areaID: String?

    //构造方法
    init(areaName: String, areaID: String) {
        self.areaName = areaName
        self.areaID = areaID
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(areaName, forKey: .areaname)
        try container.encode(areaID, forKey: .areaId)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy:CodingKeys.self)

        areaName = try container.decode(String.self, forKey: .areaname)
        areaID = try container.decode(String.self, forKey: .areaId)
    }
}

@objcMembers class User: NSObject, Codable {
    private enum CodingKeys: CodingKey {
        case area
        case staffId
        case staffName
    }

    /// 工区
    var area: Area?
    /// 手机保存的用户 登录名
    dynamic var loginID: String = ""
    /// 客服 系统数据库中的用户 ID  staffId = sysUserId
    dynamic var staffId: String = ""
    /// 客服 系统数据库中的用户 ID  staffId = sysUserId
    dynamic var staffName: String = ""
    /// 本系统数据库中的用户 ID staffId = sysUserId
    dynamic var sysUserId: String = ""
    /// 本系统数据库中的用户 ID staffId = sysUserId
    dynamic var sysUserName: String = ""
    /// 本系统密码
    dynamic var password: String = ""
    /// 机构名称
    dynamic var deptName: String = ""
    /// 电话号码
    dynamic var telephone: String = ""



    //构造方法
    init(area: Area, staffId: String, staffName: String) {

        self.area = area
        self.staffId = staffId
        self.staffName = staffName
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(staffId, forKey: .staffId)
        try container.encode(staffName, forKey: .staffName)
        try container.encode(area, forKey: .area)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy:CodingKeys.self)

        staffId = try container.decode(String.self, forKey: .staffId)
        staffName = try container.decode(String.self, forKey: .staffName)
        area = try container.decode(Area.self, forKey: .area)
    }

}

//MARK: - Request
extension User{
    // MARK: - 类方法
    
    /**
     登录

     - parameter username:          用户名
     - parameter password:          密码
     - parameter completionHandler: 登录回调
     */
//    class func login(_ phoneNumber: String, password: String, autoLogin: Bool, rememberPassword: Bool,
//                     completionHandler: @escaping (YILValueResponse<User>) -> Void
//        ) {
//        UserManager.shared.removeAllCookies()
//        let params = ["userName": phoneNumber,
//                      "passWord": password]
//        NetworkHelper.actionCodable("servlet/appservlet/settingManage/LOGIN_AUTH", params: params) { (response: YILValueResponse<User>) in
//            guard response.resultCode == .success else {
//                completionHandler(response)
//                return
//            }
//
//            guard let user = response.value else {
//                completionHandler(response)
//                return
//            }
//            user.loginID = phoneNumber
//            UserManager.shared.currentUser = user
//            //保存当前账号
////            let userData = user.loginID?.data(using: String.Encoding.utf8)
////            let base64String = userData?.base64EncodedString(options: .lineLength64Characters)
//            YILSettings.shared[kCurrentUser] = user.loginID
//            YILSettings.shared[kUserPassword] = password
////            YILSettings.shared[kCurrentUser] = user.loginID!
//
////            let passwordData = password.data(using: String.Encoding.utf8)
////            let base64String = passwordData?.base64EncodedString(options: .lineLength64Characters)
////            BPush.bindChannel { (result, error) in
////                let channelID = BPush.getChannelId()
////                YILLog.info("channelID:\(String(describing: channelID))")
////                let params = ["userName": user.loginID,
////                              RequestKeys.channelId: channelID ?? "",
////                              RequestKeys.deviceType: 4,
////                              RequestKeys.userId: user.userId] as [String : Any]
////                NetworkHelper.action("uploadInfo", params: params, completion: { (response: YILValueResponse<[AnyHashable: Any]>) in
////                })
////            }
//            completionHandler(YILValueResponse(resultCode: .success))
//        }
//    }

    // MARK: - 实例方法
    // MARK: 账户相关
    
    /**
     忘记密码
     
     - parameter phoneNumber:          用户名
     - parameter verifyCode:          验证码
     - parameter completionHandler: 登录回调
     */
//    func forgetPassword(_ phoneNumber:String, verifyCode: String,
//                             completionHandler: @escaping (YILValueResponse<[AnyHashable: Any]>) -> Void
//        ) {
//        UserManager.shared.removeAllCookies()
//        let params = [RequestKeys.phoneNbr: phoneNumber,
//                      RequestKeys.verifyCode: verifyCode]
//        NetworkHelper.actionCodable("forgetPW", params: params, completion: completionHandler)
//    }
//
//    func uploadHeadImage(_ image: UIImage,
//                        completionHandler: @escaping (YILValueResponse<[AnyHashable: Any]>) -> Void
//        ) {
//        let newImage = UIImage(cgImage: image.cgImage!, scale: 0.1, orientation: .up)
//        let data = UIImageJPEGRepresentation(newImage, 0.5)
//
//        guard let dataString = data?.base64EncodedString() else {
//            return
//        }
//
//        guard let loginID = UserManager.shared.currentUser?.loginID else {
//            assert(UserManager.shared.currentUser?.loginID == nil, "loginID不存在")
//            return
//        }
//        let params = ["userName": loginID,
//                      RequestKeys.fileName: "userHead.jpeg",
//                      RequestKeys.fileContent: dataString]
//        NetworkHelper.actionCodable("uploadimg", params: params) { (response: YILValueResponse<[AnyHashable: Any]>) in
//            guard response.resultCode == .success else {
//                return
//            }
//            guard let value = response.value,
//                !value.isEmpty,
//                value.keys.contains("head") else {
//                return
//            }
////            UserManager.shared.currentUser?.head = (value["head"] as? String) ?? ""
////            NotificationCenter.default.post(name: NSNotification.Name(kHeadURLUpdated), object: nil)
////            completionHandler(response)
//        }
//    }
//
//    /**
//     重置密码
//     - parameter username:          用户名
//     - parameter password:          密码
//     - parameter completionHandler: 登录回调
//     */
//    func resetPassword(_ phoneNumber:String, password:String,
//                             completionHandler: @escaping (YILValueResponse<[AnyHashable: Any]>) -> Void
//        ) {
//        UserManager.shared.removeAllCookies()
//        let params = [RequestKeys.phoneNbr: phoneNumber,
//                      RequestKeys.password: password.md5(),
//                      RequestKeys.qpassword: password.md5()]
//        NetworkHelper.actionCodable("resetPW", params: params, completion: completionHandler)
//    }
//
//    func resetUserInfo(_ nickName:String,
//                       userName:String,
//                       head:String,
//                       telephone:String,
//                       address:String,
//                       completionHandler: @escaping (YILValueResponse<[AnyHashable: Any]>) -> Void
//        ) {
//
//        let params = ["nickName": nickName,
//                  "userName": userName,
//                  "head": head,
//                  "telephone": telephone,
//                  "address": address,
//                  "userName": loginID
//        ]
//        NetworkHelper.actionCodable("personalInfoSync", params: params, showHUD: true) { (response: YILValueResponse<[AnyHashable: Any]>) in
//            guard response.resultCode == .success else {
//                return
//            }
//            self.telephone = telephone
//            NotificationCenter.default.post(name: NSNotification.Name(kUserInfoUpdated), object: nil)
//            completionHandler(response)
//        }
//    }


}
