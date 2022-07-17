//
//  UIViewExtension.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2022/07/14.
//  Copyright © 2022 hansub yoo. All rights reserved.
//

import UIKit

extension UIView {
    open func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}




