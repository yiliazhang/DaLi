//
//  Car.swift
//  clw
//
//  Created by apple on 2016/10/13.
//  Copyright © 2016年 Datang. All rights reserved.
//

import UIKit

class Car: NSObject, Codable {
    @objc dynamic var EquipmentId: String?
    @objc dynamic var cartype: String?
    @objc dynamic var model: String?
    @objc dynamic var cdmanumber: String?
    @objc dynamic var framenumber: String?
    var isOnLine: Bool = false
    var voltage: Int32 = 0
    @objc dynamic var insuranceSts: String?
    @objc dynamic var insuranceExpdate: String?
}

//extension Car:  {
    /**
    // MARK: 围栏
    func requestEletronicFenceList(_ completionHandler: @escaping (YILValueResponse) -> Void
        ) {
        guard  let user = UserManager.shared.currentUser,
            !user.loginCode.isEmpty,
            let deviceID = EquipmentId,
            !deviceID.isEmpty else {
            assert(false, "loginCode ,或EquipmentId 无效")
            return
        }
        let params = [RequestKeys.loginCode: user.loginCode,
                      RequestKeys.equipmentId: deviceID] as [String : Any]
        yil_action("elefenceList", params: params, cache: false, showHUD: false, completion: completionHandler)
    }
    
    func requestDeviceInfo(_ completionHandler: @escaping (YILValueResponse) -> Void
        ) {
        guard let deviceID = EquipmentId,
            !deviceID.isEmpty else {
            assert(false, "设备EquipmentId 为 nil 或为空")
            return
        }
        let params = [RequestKeys.equipmentId: deviceID] as [String : Any]
        yil_action("devicedetail", params: params, cache: false, showHUD: false) { (response: YILValueResponse) in
            guard response.resultCode == .success else {
                return
            }
            guard let value = response.value,
                let newValue = value.dictionary,
                !newValue.isEmpty else {
                    return
            }
            self.EquipmentId = newValue["EquipmentId"]?.stringValue
            self.cartype = newValue["cartype"]?.stringValue
            self.model = newValue["model"]?.stringValue
            self.framenumber = newValue["framenumber"]?.stringValue
            self.voltage = newValue["voltage"]?.int32 ?? 0;
            self.insuranceSts = newValue["insuranceSts"]?.stringValue
            self.insuranceExpdate = newValue["insuranceExpdate"]?.stringValue
            self.cdmanumber = newValue["cdmanumber"]?.stringValue
            completionHandler(response)
        }
    }
    
    
    func requestSynchonizeEletronicFence(_ name: String,
                                         radius: Double,
                                         latitude: Double,
                                         longitude: Double,
                                         completionHandler: @escaping() -> Void) {
        guard  let user = UserManager.shared.currentUser,
            !user.loginCode.isEmpty,
            let deviceID = EquipmentId,
            !deviceID.isEmpty else {
                assert(false, "loginCode ,或EquipmentId 无效")
                return
        }
    
        let params = [RequestKeys.loginCode: user.loginCode,
                      RequestKeys.equipmentId: deviceID,
                      RequestKeys.radius: String(format: "%.0f",  radius),
                      RequestKeys.elefenceName: name,
                      RequestKeys.centralPoint: "\(longitude),\(latitude)"] as [String : Any]
        yil_action("elefenceSync", params: params, cache: false, showHUD: false) { (response) in
            guard response.resultCode == .success else {
                return
            }
            completionHandler()
        }
    }

 */
//}

