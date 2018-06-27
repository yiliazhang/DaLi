//
//  UIButton+Application.swift
//  clw
//
//  Created by apple on 2016/10/17.
//  Copyright © 2016年 Datang. All rights reserved.
//

import UIKit

extension UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    class func blueButton(frame: CGRect = .zero) -> UIButton {
        let button = UIButton(type: .custom)
        button.frame = frame
//        button.setBackgroundImage(UIImage.image(UIColor.buttonNormalColor), for: .normal)
//        button.setBackgroundImage(UIImage.image(UIColor.buttonHighlightedColor), for: .highlighted)
//        button.setBackgroundImage(UIImage.image(UIColor.buttonDisabledColor), for: .disabled)
        return button
    }
}
