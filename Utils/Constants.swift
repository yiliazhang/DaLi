//
//  Constants.swift
//  DLFP
//
//  Created by apple on 16/3/10.
//  Copyright © 2016年 yilia. All rights reserved.
//

import Foundation
import UIKit



/// 总用户信息文件夹
let CONFIG_CACHE_DIR = NSHomeDirectory() + "/Library/Caches/Config"
/// 屏幕布局配置文件夹
let USER_CACHE_DIR = NSHomeDirectory() + "/Library/Caches/Users"

/// 缓存文件夹
let CACHES_DIR = NSHomeDirectory() + "/Library/Caches"


//let FP_CONFIG_FILENAME = "Config.archive"
/// 布局文件扩展名
let ARCHIVE_EXTENSION = ".archive"

/// 图片文件扩展名
let IMAGE_EXTENSION = ".png"

/// 空布局文件路径
let EMPTY_CONFIG = NSHomeDirectory() + "/Documents/emptyConfig" + ARCHIVE_EXTENSION

/// 缓存文件件路径
let CONFIG_CACHE = NSHomeDirectory() + "/Library/Caches/Config/config" + ARCHIVE_EXTENSION

/// 所有频道本地缓存路径
let CHANNELS_FILE = NSHomeDirectory() + "/Library/Caches/Config/channels" + ARCHIVE_EXTENSION

///服务器上的布局文件地址
let SERVER_CONFIG_CACHE_ONE = NSHomeDirectory() + "/Library/Caches/Config/serverConfig" + ARCHIVE_EXTENSION

/// SERVER_CONFIG_CACHE_ONE 的备份地址
let SERVER_CONFIG_CACHE_TWO = NSHomeDirectory() + "/Library/Caches/Config/serverCachesConfig"  + ARCHIVE_EXTENSION

let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!

let cachesURL =  FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).last!

let cachesPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!

let libraryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last!

let libraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!

/// 输入源inPortNumber无效值
let inValidValue = -1

let kCurrentUser = "com.clw.currentUser"
let kUserPassword = "com.clw.userPassword"

let kHasNewAlert = "com.clw.notification.alert.hasNew"
let kHasNewFailure = "com.clw.notification.failure.hasNew"
let kHasNewMessage = "com.clw.notification.message.hasNew"


let inset1: CGFloat = 2
let inset8: CGFloat = 8
let inset10: CGFloat = 10
let inset16: CGFloat = 16
let inset20: CGFloat = 20
let viewHeight: CGFloat = 44

let fontSize12: CGFloat = 12
let fontSize14: CGFloat = 14
let fontSize16: CGFloat = 16
let fontSize18: CGFloat = 18
let fontSize24: CGFloat = 24



struct RequestKeys {
    static let loginCode = "userName"
    static let passWord = "passWord"
    static let phoneNbr = "phoneNbr"
    static let verifyCode = "verifyCode"
    static let verifyType = "verifyType"
    static let password = "password"
    static let qpassword = "qpassword"
    static let equipmentId = "EquipmentId"
    static let alarmType = "alarmType"
    static let nickName = "nickName"
    static let head = "head"
    static let telephone = "telephone"
    static let address = "address"
    static let controlType = "controlType"
    static let startTime = "startTime"
    static let endTime = "endTime"
    static let fileName = "fileName"
    static let fileContent = "fileContent"
    static let frameNumber = "framenumber"
    static let changeType = "changeType"
    static let centralPoint = "centralPoint"
    static let radius = "radius"
    static let elefenceName = "elefenceName"
    static let elefenceId = "elefenceId"
    static let page = "page"
    static let type = "type"
    static let ctpSwitch = "ctpSwitch"
    static let shockSwitch = "shockSwitch"
    static let channelId = "channelId"
    static let deviceType = "deviceType"
    static let userId = "userId"
    
}


let kHeadURLUpdated = "com.clw.headURL"
let kUserInfoUpdated = "com.clw.userInfo"
let kHost = "com.clw.hosts"
let kPort = "8800"


