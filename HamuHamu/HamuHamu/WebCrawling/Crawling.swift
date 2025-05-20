//
//  Crawling.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2020/10/28.
//  Copyright © 2020 hansub yoo. All rights reserved.
//

import Foundation
import SwiftSoup

public class Crawling {
    private var htmlBody: String?
    
    func getHTML(_ url: String) {
        guard let myURL = URL(string: url) else {
            print("Error: valid URL")
            return
        }
        
        do {
            let myURLString = try String(contentsOf: myURL, encoding: .ascii)
            htmlBody = myURLString
            print("HTML: \(myURLString)")
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    func getEvent() -> String {
//        let doc: Document = try SwiftSoup.parse(htmlBody)
//        
//        let p: Element = try doc.select("p")
//        print(p)
        
        // 이미지, 제목, 내용, 링크(링크는 굳이 넣지 않아도 된다.)
        return ""
    }
}
