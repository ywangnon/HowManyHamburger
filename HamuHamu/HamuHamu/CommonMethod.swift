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
