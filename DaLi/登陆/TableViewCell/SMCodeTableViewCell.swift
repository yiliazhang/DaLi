//
//  SMCodeTableViewCell.swift
//  clw
//
//  Created by apple on 2016/10/15.
//  Copyright © 2016年 Datang. All rights reserved.
//

import UIKit
import SnapKit
class SMCodeTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = NSStringFromClass(SMCodeTableViewCell.self)
   
    var textField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.autoresizingMask = .flexibleWidth
        return tf
    }()
    
    var smCodeButton: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitleColor(.appTintColor, for: .normal)
//        button.setTitleColor(UIColor.placeholderColor, for: .disabled)
//        button.titleLabel?.font = yil_font(14)
        button.setTitle("获取验证码", for: .normal)
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupView() {
        contentView.addSubview(smCodeButton)
        smCodeButton.snp.makeConstraints { (make) in
            make.rightMargin.equalTo(-8)
            make.centerY.equalTo(contentView)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
        
        let seperatorLine = UIView()
        seperatorLine.backgroundColor = UIColor.groupTableViewBackground
        contentView.addSubview(seperatorLine)
        seperatorLine.snp.makeConstraints { (make) in
            make.right.equalTo(smCodeButton.snp.left).offset(-8)
            make.topMargin.equalTo(2)
            make.bottomMargin.equalTo(-2)
            make.width.equalTo(0.5)
        }
        
        contentView.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(8)
            make.right.equalTo(seperatorLine.snp.left).offset(-8)
            make.height.equalTo(30)
            make.topMargin.equalTo(8)
            make.bottomMargin.equalTo(-8)
            
        }
    }
    static func cell(nib: String = reuseIdentifier) -> SMCodeTableViewCell {
        let cell = Bundle.main.loadNibNamed(reuseIdentifier, owner: nil, options: nil)?.first as? SMCodeTableViewCell
        //        let cell = UINib(nibName: reuseIdentifier, bundle: nil).first? as TextFieldTableViewCell
        assert(cell != nil, "cell 不存在 nib 实例")
        return cell!
    }
}
