//
//  SignUpViewController.swift
//  DaLi
//
//  Created by apple on 2018/6/27.
//  Copyright © 2018年 bjdv. All rights reserved.
//

import UIKit
import YILUtilKit
class SignUpViewController: UIViewController, SMSCodeManagerProtocol {
    fileprivate struct Constants {
        static  let textFieldCellIdentifier = "com.signUp." + TextFieldTableViewCell.reuseIdentifier
        static  let smsCodeCellIdentifier = "com.signUp." + SMCodeTableViewCell.reuseIdentifier
    }
    
    fileprivate lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()

    fileprivate lazy var signUpButton: UIButton = {[unowned self] in
        let button = UIButton()
        button.frame = CGRect(x: 16, y: 0, width: SCREEN_WIDTH - 16 * 2, height: 44)
        button.setTitle("注册", for: .normal)
        //        button.setBackgroundImage(UIImage.image(.appTintColor), for: .normal)
        button.addTarget(self, action: #selector(SignUpViewController.signUp), for: .touchUpInside)
        button.isEnabled = false
        yil_roundRectView(button, radius: 5)
        button.addSubview(self.activityIndicatorView)
        return button
        }()

    fileprivate lazy var tableView: UITableView = {[unowned self] in
        let tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: Constants.textFieldCellIdentifier)
        tableView.register(SMCodeTableViewCell.self, forCellReuseIdentifier: Constants.smsCodeCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))

        let rect = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 44)
        let footerView = UIView(frame: rect)
        footerView.backgroundColor = .clear
        tableView.tableFooterView = footerView
        footerView.addSubview(self.signUpButton)
        return tableView
        }()

    var newPhoneNumber: String = ""

    var phoneNumber: String {
        get {
            return newPhoneNumber
        }
        set {
            newPhoneNumber = newValue
        }
    }

    fileprivate var password: String = ""
    fileprivate var password1: String = ""
    fileprivate var smsCode: String = ""
    fileprivate var smsCodeManager: SMSCodeManager?

    var isPhoneNumberFormatOK = false
    var isSMCodeFormatOK = false
    var isPasswordFormatOK = false
    var isPassword1FormatOK = false

    @objc var isLoading = false


    // MARK: - life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
//        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: Constants.textFieldCellIdentifier)
//        tableView.register(SMCodeTableViewCell.self, forCellReuseIdentifier: Constants.smsCodeCellIdentifier)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "hello")
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @objc func signUp() {
        isEditing = false
        if phoneNumber.isEmpty {
            //            keyWindow?.yil.toastInfo("请输入手机号")
            return
        }

        if password.isEmpty {
            //            keyWindow?.yil.toastInfo("请输入密码")
            return
        }

        if password1.isEmpty {
            //            keyWindow?.yil.toastInfo("请输入确认密码")
            return
        }
        if password != password1 {
            //            keyWindow?.yil.toastInfo("两次输入密码不一致，请重新输入")
            return
        }
        activityIndicatorView.startAnimating()
        signUpButton.isEnabled = false
        //        self.pageModel.action(phoneNumber, password: password, verifyCode: smsCode){ (response) in
        //            self.activityIndicatorView.stopAnimating()
        //            self.signUpButton.isEnabled = true
        //            if self.pageModel is ForgotPassword ||
        //                self.pageModel is ResetPassword {
        //                yil.hudSuccess("密码修改成功")
        //                // TODO: - 返回上一页
        //                let _ = self.navigationController?.popViewController(animated: true)
        //            } else {
        //                yil.hudSuccess("注册成功")
        //                // TODO: - 进入绑定车辆页面
        //                //                let vc = AddDeviceViewController()
        //                //                vc.hidesBottomBarWhenPushed = true
        //                //                self.navigationController?.pushViewController(vc, animated: true)
        //            }
        //        }
    }

    func setupView() {
        view.addSubview(tableView)
        activityIndicatorView.center = CGPoint(x: signUpButton.center.x - 80, y: signUpButton.center.y)
    }
}

extension SignUpViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
        let cellOne = tableView.dequeueReusableCell(withIdentifier: Constants.smsCodeCellIdentifier) as? SMCodeTableViewCell
        guard let cell = cellOne else {
            return cellOne ?? UITableViewCell()
        }
            cell.textField.keyboardType = .phonePad
            cell.textField.placeholder = "请输入手机号"
            if #available(iOS 10.0, *) {
                cell.textField.textContentType = UITextContentType.telephoneNumber
            }
            cell.textField.text = phoneNumber
            cell.textField.clearButtonMode = .whileEditing
            cell.textField.delegate = self
            cell.selectionStyle = .none
//            cell.separatorInset = .zero
            cell.clipsToBounds = true
            if self.smsCodeManager == nil {

                self.smsCodeManager = SMSCodeManager(cell.smCodeButton, delegate: self)

            }
            if cell.textField.text != nil {
                cell.smCodeButton.isEnabled = Validate.phoneNum(cell.textField.text!).isRight
            } else {
                cell.smCodeButton.isEnabled = false
            }
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.textFieldCellIdentifier) as! TextFieldTableViewCell
            if indexPath.row == 1 {
                cell.textField.keyboardType = .phonePad
                cell.textField.placeholder = "请输入验证码"
                cell.textField.isSecureTextEntry = true
            } else if indexPath.row == 2 {
                cell.textField.keyboardType = .emailAddress
                cell.textField.placeholder = "6-10位数字或字母"
                cell.textField.isSecureTextEntry = true
            } else {
                cell.textField.keyboardType = .emailAddress
                cell.textField.placeholder = "请确认密码"
                cell.textField.isSecureTextEntry = true
            }
            cell.textField.clearButtonMode = .whileEditing
            cell.textField.clearsOnBeginEditing = true
            cell.textField.delegate = self
            cell.selectionStyle = .none
//            cell.separatorInset = .zero;
            cell.clipsToBounds = true
            return cell
        }
    }
}

// MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let toBeStr = textField.text else {return false}

        guard let from16 = toBeStr.utf16.index(toBeStr.utf16.startIndex, offsetBy: range.location, limitedBy: toBeStr.utf16.endIndex) else { return false }
        guard let to16 = toBeStr.utf16.index(from16, offsetBy: range.length, limitedBy: toBeStr.utf16.endIndex) else { return false }
        guard let from = String.Index(from16, within: toBeStr) else { return false }
        guard let to = String.Index(to16, within: toBeStr) else { return false }

        let toBeString = toBeStr.replacingCharacters(in: from ..< to, with: string)
        var v = textField as UIView
        while !v.isKind(of: UITableViewCell.self) {
            v = v.superview!
        }
        let cell = v as! UITableViewCell
        var indexPath = tableView.indexPath(for: cell)!
        if indexPath.row == 0 {
            guard toBeString.count <= 11 else {
                return false
            }
            isPhoneNumberFormatOK = Validate.phoneNum(toBeString).isRight
            newPhoneNumber = toBeString
        } else if indexPath.row == 1 {
            guard toBeString.count <= 6 else {
//                keyWindow?.yil.toastInfo("6位数字验证码")
                return false
            }
            isSMCodeFormatOK = (toBeString.count == 6)
            smsCode = toBeString
        } else if indexPath.row == 2 {
            guard toBeString.count <= 10 else {
//                keyWindow?.yil.toastInfo("密码为6-10位数字或密码")
                return false
            }
            isPasswordFormatOK = Validate.password(toBeString).isRight
            password = toBeString
        } else if indexPath.row == 3 {
            guard toBeString.count <= 10 else {
//                keyWindow?.yil.toastInfo("请确认密码")
                return false
            }
            isPassword1FormatOK = Validate.password(toBeString).isRight
            password1 = toBeString
        }

        signUpButton.isEnabled = (isPassword1FormatOK
            && isSMCodeFormatOK
            && isPasswordFormatOK
            && isPhoneNumberFormatOK)

        if indexPath.row == 0 {
            if isPhoneNumberFormatOK {
                let cell = cell as! SMCodeTableViewCell
                cell.smCodeButton.isEnabled = true
            }
        }
        return true;
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        signUpButton.isEnabled = false
        var v = textField as UIView
        while !v.isKind(of: UITableViewCell.self) {
            v = v.superview!
        }
        let cell = v as! UITableViewCell
        var indexPath = tableView.indexPath(for: cell)!
        if indexPath.row == 0 {
            let cell = cell as! SMCodeTableViewCell
            cell.smCodeButton.isEnabled = false
        }

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        isEditing = false
        signUpButton.isEnabled = (isPasswordFormatOK && isPhoneNumberFormatOK)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
