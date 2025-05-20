//
//  Network.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2022/07/14.
//  Copyright © 2022 hansub yoo. All rights reserved.
//

import Foundation

struct HamburgerNetwork {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

//extension HamburgerNetwork {
//    struct StoreURL {
//        static let burgerking
//        static let
//    }
//}
