//
//  DBModel.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/10/13.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class HamburgerCalorie: Object {
    var brand: String = ""
    var name: String = ""
    var calorie: Int = 0
    
    override static func primaryKey() -> String? {
      return "name"
    }
}
