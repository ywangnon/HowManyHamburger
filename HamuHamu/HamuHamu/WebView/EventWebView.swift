//
//  EventWebView.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 24/07/2019.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

enum Brand: String {
    case king = "https://www.burgerking.co.kr/m/event?esq=614&online=N"
    case kfc = "https://www.kfckorea.com/promotion/promotionList/A801"
//    case lotte = "http://www.lotteria.com/Event/Event_List.asp"
    case lotte = "http://m.lotteria.com/event/event.do"
//    case mc = "http://m.mcdonalds.co.kr/me/kor/event/event_list.do"
    case mc = "http://m.mcdonalds.co.kr/kor/promotion/list.do"
}

import UIKit
import WebKit

class EventWebView: UIViewController {

    var webView: WKWebView!
    
    var brandURL = ""
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:self.brandURL)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ brand: Brand) {
        self.init()
        
        self.brandURL = brand.rawValue
        self.setViewFoundation(brand)
    }
    
    func setViewFoundation(_ brand: Brand) {
        var img = UIImage()
        switch brand {
        case .kfc:
            img = UIImage(named: "KFC_title")!
            self.navigationItem.title = "KFC"
        case .king:
            img = UIImage(named: "burgerking_title")!
            self.navigationItem.title = "BurgerKing"
        case .lotte:
            img = UIImage(named: "lotteria_title")!
            self.navigationItem.title = "Lotteria"
        case .mc:
            img = UIImage(named: "mcdonalds_title")!
            self.navigationItem.title = "McDonald's"
        }
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFit
//        self.navigationItem.titleView = imgView
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "cheese_arrow"), style: .plain, target: self, action: #selector(leftBarButton(_:)))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.yellow

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension EventWebView {
    @objc func leftBarButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension EventWebView: WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in
            completionHandler()
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in
            completionHandler(true)
        }))
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: { (action) in
            completionHandler(false)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping (String?) -> Void) {
        let alertController = UIAlertController(title: "", message: prompt, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.text = defaultText
        }
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in
            if let text = alertController.textFields?.first?.text {
                completionHandler(text)
            } else {
                completionHandler(defaultText)
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: { (action) in
            completionHandler(nil)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        // 중복적으로 리로드가 일어나지 않도록 처리 필요.
        webView.reload()
    }
}

extension EventWebView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print(webView.url?.absoluteString)
    }
}
