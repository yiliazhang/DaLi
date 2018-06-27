//
//  PhoneNumberTableViewCell.swift
//  clw
//
//  Created by apple on 2016/10/14.
//  Copyright © 2016年 Datang. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = NSStringFromClass(TextFieldTableViewCell.self)

    lazy var textField: UITextField = {
        let tf = UITextField(frame: CGRect.zero)
        tf.font = UIFont.systemFont(ofSize: 16)
//        tf.autoresizingMask = .flexibleWidth
        return tf
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(textField)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(8)
            make.rightMargin.equalTo(8)
            make.center.equalTo(contentView)
            make.height.equalTo(30)
            make.topMargin.equalTo(8)
            make.bottomMargin.equalTo(-8)
        }
    }
    
//    override class var requiresConstraintBasedLayout: Bool {
//        return true
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    static func cell(nib: String = reuseIdentifier) -> TextFieldTableViewCell {
        let cell = Bundle.main.loadNibNamed(reuseIdentifier, owner: nil, options: nil)?.first as? TextFieldTableViewCell
//        let cell = UINib(nibName: reuseIdentifier, bundle: nil).first? as TextFieldTableViewCell
        assert(cell != nil, "cell 不存在 nib 实例")
        return cell!
    }
    
    
}
