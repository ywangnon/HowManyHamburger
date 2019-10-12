//
//  CommonMethod.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 26/09/2019.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class CommonMethod {
    public static var shared = CommonMethod()
}

extension CommonMethod {
    func notificationSetting() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (didAllow, Error) in
            
        }
    }
    
    func appVersion() -> String? {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

        if let version = version{
                print("version: \(version)")
        }
        
        return version
    }
}

extension UIView {
    open func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    func anchorsEqualTo(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchorsXY(centerX: NSLayoutXAxisAnchor?, constantX: CGFloat = 0, centerY: NSLayoutYAxisAnchor?, constantY: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX, constant: constantX).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY, constant: constantY).isActive = true
        }
    }
    
}

extension UIColor {
    static func getRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension String {

     var localized: String {
           return NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
        }
}
