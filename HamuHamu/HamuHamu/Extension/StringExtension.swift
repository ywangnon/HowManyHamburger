//
//  StringExtension.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2022/07/14.
//  Copyright © 2022 hansub yoo. All rights reserved.
//

import Foundation

extension String {
    // 지역화
    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
    }
    
    // 앱 버전
    var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        if let version = version {
            return version
        }
        return "1.0.0"
    }
    
    // 앱스토어 최신 앱 버전
    var appStoreVersion: String {
        let appleID = "이곳에 Apple ID"
        guard let url = URL(string: "http://itunes.apple.com/lookup?id=\(appleID)"),
              let data = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
              let json = json,
              let results = json["results"] as? [[String: Any]],
              let appStoreVersion = results[0]["version"] as? String else {
            return "1.0.0"
        }
        return appStoreVersion
    }
    
    
    // 버전 비교
    var versions: [Int] {
        components(separatedBy: ".").map { Int($0) ?? 0 }
    }
    
    /// 업데이트가 필요한지 여부
    /// - Parameter serverVersion: 서버 버젼 ex) "1.1.1"
    /// - Returns: 업데이트 필요하면 true, 아니면 false
    func needUpdate(_ appStoreVersion: String) -> Bool {
        versions.lexicographicallyPrecedes(appStoreVersion.versions)
    }
}
