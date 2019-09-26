//
//  CommonMethod.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 26/09/2019.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import Foundation
import UserNotifications

class CommonMethod {
    open static var shared = CommonMethod()
}

extension CommonMethod {
    func notificationSetting() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (didAllow, Error) in
            
        }
        
        NotificationCenter.default
    }
}
