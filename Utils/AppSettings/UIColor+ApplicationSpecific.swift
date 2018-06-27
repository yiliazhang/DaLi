/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    Application-specific color convenience methods.
*/

import UIKit
//import Hue
extension UIColor {
    static var appTintColor: UIColor {
        return UIColor(red:0.18, green:0.59, blue:0.91, alpha:1.00)
    }
    
    static var placeholderColor: UIColor {
        return UIColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1)
    }
    
    static var buttonNormalColor: UIColor {
        return UIColor.appTintColor
    }
    
    static var buttonHighlightedColor: UIColor {
//        return UIColor(hex: "#1976D2")
        return .groupTableViewBackground
    }
    
    static var buttonDisabledColor: UIColor {
//        return UIColor(hex: "#90caf9")
        return .groupTableViewBackground
    }
    static var formerColor: UIColor {
//        return UIColor(hex: "#222222")
        return .groupTableViewBackground
    }
    
    static var formerSubColor: UIColor {
//        return UIColor(hex: "#7A7A7A")
        return .groupTableViewBackground
    }
    
    static var formerHighlightedSubColor:  UIColor {
        return UIColor(red: 1, green: 0.7, blue: 0.12, alpha: 1)
    }
}
