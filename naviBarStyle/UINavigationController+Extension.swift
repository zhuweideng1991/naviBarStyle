//
//  UINavigationController+Extension.swift
//  naviBarStyle
//
//  Created by zhu on 2017/9/26.
//  Copyright © 2017年 alwayslight. All rights reserved.
//

import UIKit

//适配 iPhoneX
let kStatusBarHeight = UIApplication.shared.statusBarFrame.height
let kNavBarHeight: CGFloat = 44.0
let kTopHeight = kStatusBarHeight + kNavBarHeight
let kTabBarHeight = kStatusBarHeight > 20 ? 83:49

private var alphaViewKey = "alphaViewKey"
extension UINavigationController {
    var zh_alphaView: UIView? {
        set {
            objc_setAssociatedObject(self, &alphaViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &alphaViewKey) as? UIView
        }
    }
    
    func zh_setBackgroundColor(color: UIColor, alpha: CGFloat) {
        if zh_alphaView == nil {
            zh_alphaView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: kTopHeight))
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
//            navigationBar.insertSubview(zh_alphaView!, at: 0)     //ios 11下遮挡 标题
            navigationBar.subviews[0].insertSubview(zh_alphaView!, at: 0)
        }
        zh_alphaView?.backgroundColor = color.withAlphaComponent(alpha)
    }
}

