//
//  FranchiseCell.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 06/10/2019.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit
import WebKit

class FranchiseCell: UICollectionViewCell {
    var eventPageURL: String?
    
    var callAction: (()->Void)?
    
    var titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var logoView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var titleBoxView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var infoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var callButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("☏\t전화", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var eventView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var eventWebView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setAddSubViews()
        self.setLayouts()
        self.setAddTargets()
        self.setDelegates()
        self.setViewFoundations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        self.setAddSubViews()
        self.setLayouts()
        self.setAddTargets()
        self.setDelegates()
        self.setViewFoundations()
    }
    
}

extension FranchiseCell {
    func setViewFoundations() {
        
    }
    
    func setAddSubViews() {
        self.addSubviews([self.titleView,
                          self.infoView,
                          self.eventView])
        self.titleView.addSubviews([self.logoView,
                                    self.titleBoxView,
                                    self.titleLabel])
        self.infoView.addSubviews([self.callButton])
        self.eventView.addSubviews([self.eventWebView])
    }
    
    func setLayouts() {
        NSLayoutConstraint.activate([
            self.titleView.topAnchor.constraint(equalTo: self.topAnchor),
            self.titleView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.titleView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/5)
        ])
        
        NSLayoutConstraint.activate([
            self.infoView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor),
            self.infoView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.infoView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.infoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/5),
        ])
        
        NSLayoutConstraint.activate([
            self.eventView.topAnchor.constraint(equalTo: self.infoView.bottomAnchor),
            self.eventView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.eventView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.eventView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.logoView.topAnchor.constraint(equalTo: self.titleView.topAnchor),
            self.logoView.leadingAnchor.constraint(equalTo: self.titleView.leadingAnchor),
            self.logoView.trailingAnchor.constraint(equalTo: self.titleView.trailingAnchor),
            self.logoView.heightAnchor.constraint(equalTo: self.titleView.heightAnchor, multiplier: 2/3)
        ])
        
        NSLayoutConstraint.activate([
            self.titleBoxView.centerXAnchor.constraint(equalTo: self.titleView.centerXAnchor),
//            self.titleBoxView.bottomAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: -5),
            self.titleBoxView.centerYAnchor.constraint(equalTo: self.logoView.bottomAnchor),
            self.titleBoxView.heightAnchor.constraint(equalTo: self.titleView.heightAnchor, multiplier: 1/5),
            self.titleBoxView.widthAnchor.constraint(equalTo: self.titleView.widthAnchor, multiplier: 1/2)
        ])
        
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.titleBoxView.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.titleBoxView.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            self.callButton.topAnchor.constraint(equalTo: self.infoView.topAnchor),
            self.callButton.bottomAnchor.constraint(equalTo: self.infoView.bottomAnchor),
            self.callButton.leadingAnchor.constraint(equalTo: self.infoView.leadingAnchor),
            self.callButton.trailingAnchor.constraint(equalTo: self.infoView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.eventWebView.topAnchor.constraint(equalTo: self.eventView.topAnchor),
            self.eventWebView.leadingAnchor.constraint(equalTo: self.eventView.leadingAnchor),
            self.eventWebView.trailingAnchor.constraint(equalTo: self.eventView.trailingAnchor),
            self.eventWebView.bottomAnchor.constraint(equalTo: self.eventView.bottomAnchor),
        ])
    }
    
    func setDelegates() {
        self.eventWebView.uiDelegate = self
        self.eventWebView.navigationDelegate = self
    }
    
    func setAddTargets() {
        self.callButton.addTarget(self, action: #selector(callButton(_:)), for: .touchUpInside)
    }
    
    func setGestures() {
        
    }
    
}

extension FranchiseCell {
    func reloadCell() {
        if let urlStr = self.eventPageURL,
            let url = URL(string: urlStr) {
            self.eventWebView.load(URLRequest(url: url))
        } else {
            print("No URL")
        }
    }
}

extension FranchiseCell {
    @objc func callButton(_ sender: UIButton) {
        self.callAction?()
    }
}

extension FranchiseCell: WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in
            completionHandler()
        }))
        
//        self.present(alertController, animated: true, completion: nil)
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
        
//        self.present(alertController, animated: true, completion: nil)
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
        
//        self.present(alertController, animated: true, completion: nil)
    }
}

extension FranchiseCell: WKNavigationDelegate {
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        // 중복적으로 리로드가 일어나지 않도록 처리 필요.
        webView.reload()
    }
}
