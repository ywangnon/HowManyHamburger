//
//  UIColorExtension.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2022/07/14.
//  Copyright © 2022 hansub yoo. All rights reserved.
//

import UIKit

extension UIColor {
    static func getRGB(red: CGFloat,
                       green: CGFloat,
                       blue: CGFloat,
                       alpha: CGFloat = 1) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
