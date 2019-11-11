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
    case lotte = "http://m.lotteria.com/event/event.do"
    case mc = "http://m.mcdonalds.co.kr/kor/promotion/list.do"
}

enum BrandYoubute: String {
    case king = "https://m.youtube.com/channel/UCEKRI0fipK4LEgV98nI2CQA"
    case kfc = "https://www.youtube.com/user/KFCColonelSanders"
    case lotte = "https://m.youtube.com/user/lotteriakorea"
    case mc = "https://m.youtube.com/user/McDonaldsKor"
}

enum BrandFaceBook: String {
    case king = "https://m.facebook.com/burgerking/"
    case kfc = "https://m.facebook.com/KFC.KOR/"
    case lotte = "https://m.facebook.com/Lotteria/"
    case mc = "https://m.facebook.com/McDonaldsKorea/?brand_redir=50245567013"
}

import UIKit
import WebKit

class EventWebView: UIViewController {

    var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webview = WKWebView(frame: .zero, configuration: webConfiguration)
        webview.translatesAutoresizingMaskIntoConstraints = false
        return webview
    }()
    
    var brandURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewFoundation()
        self.setAddSubViews()
        self.setLayout()
        self.setDelegates()
        
        let myURL = URL(string:self.brandURL)
        print("URL::::", self.brandURL)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ url: String) {
        self.init()
        print("WebView")
        self.brandURL = url
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension EventWebView {
    func setViewFoundation() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "cheese_arrow"), style: .plain, target: self, action: #selector(leftBarButton(_:)))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.yellow
    }
    
    func setAddSubViews() {
        self.view.addSubviews([self.webView])
    }
    
    func setLayout() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.webView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.webView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            self.webView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.webView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    func setDelegates() {
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
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
