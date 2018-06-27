//
//  SMCodeManager.swift
//  clw
//
//  Created by apple on 2016/10/17.
//  Copyright © 2016年 Datang. All rights reserved.
//

import UIKit
import Moya
protocol SMSCodeManagerProtocol {
    var phoneNumber: String {get set}
}

enum VerifyType: String, CustomStringConvertible {
    case register = "R"
    case forgotPassword = "F"
    var description: String {
        switch self {
        case .register:
            return "R"
        case .forgotPassword:
            return "F"
        }
    }
}

@objc class SMSCodeManager: NSObject {
    
    var countDownButton: UIButton!
    var verifyType: VerifyType!
    var myDelegate: SMSCodeManagerProtocol!
    
    init(_ button: UIButton, verifyType: VerifyType = .register, delegate: SMSCodeManagerProtocol) {
        self.countDownButton = button
        self.verifyType = verifyType
        self.myDelegate = delegate
        super.init()
        self.countDownButton.addTarget(self, action: #selector(SMSCodeManager.beginCounting), for: .touchUpInside)
    }
    
    private var powerOnTimmer: Timer?
    fileprivate var remainingSeconds: Int = 0 {
        willSet {
            countDownButton.setTitle("\(newValue) S", for: UIControl.State.normal)
            if newValue <= 0 {
                countDownButton.setTitle("获取验证码", for: UIControl.State.normal)
                isCounting = false
            }
        }
    }
    
    private var isCounting = false {
        willSet {
            if newValue {
                powerOnTimmer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SMSCodeManager.updateTime(_:)), userInfo: nil, repeats: true)
                    RunLoop.main.add(powerOnTimmer!, forMode: .defaultRunLoopMode)//防止失效
                remainingSeconds = 60
            } else {
                powerOnTimmer?.invalidate()
                powerOnTimmer = nil
                
                countDownButton.alpha = 1.0
            }
            countDownButton.isEnabled = !newValue
        }
    }
    
    @objc func updateTime(_ timer: Timer) {
        remainingSeconds -= 1
    }
    
    @objc func beginCounting() {
        isCounting = true
        provider.request(MultiTarget(Account.downloadMoyaWebContent("0000"))) { result in
            do {
                let response = try result.dematerialize()
                let _ = try response.mapJSON()
//                self.repos = value
//                self.tableView.reloadData()
                self.endCounting()
                self.remainingSeconds = -1
                self.countDownButton.isEnabled = true
            } catch {
                let printableError = error as CustomStringConvertible
                let errorMessage = printableError.description
                print(errorMessage)
            }
        }
    }
    
    func endCounting() {
        isCounting = false
    }
}

