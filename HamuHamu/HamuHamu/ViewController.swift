//
//  ViewController.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2018. 5. 18..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit
import SafariServices
import StoreKit

class ViewController: UIViewController {

    var animationView: UIView!
    
    var kfcLogo = UIImage(named: "KFC_title")
    var mcdonaldsLogo = UIImage(named: "mcdonalds_title")
    var burgerkingLogo = UIImage(named: "burgerking_title")
    var lotteria = UIImage(named: "lotteria_title")
    
    @IBAction func burgerKingAction(_ sender: UIButton) {
        guard let url = URL(string: Brand.king.rawValue) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
        
//        let webView = EventWebView(.king)
//        self.navigationController?.pushViewController(webView, animated: true)
    }
    
    @IBAction func kfcAction(_ sender: Any) {
        guard let url = URL(string: Brand.kfc.rawValue) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
        
//        let webView = EventWebView(.kfc)
//        self.navigationController?.pushViewController(webView, animated: true)
    }
    
    @IBAction func lotteriaAction(_ sender: Any) {
        guard let url = URL(string: Brand.lotte.rawValue) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
        
//        let webView = EventWebView(.lotte)
//        self.navigationController?.pushViewController(webView, animated: true)
    }
    
    @IBAction func mcdonaldAction(_ sender: Any) {
        guard let url = URL(string: Brand.mc.rawValue) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
        
//        let webView = EventWebView(.mc)
//        self.navigationController?.pushViewController(webView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let img = UIImage(named: "food_hamburger")
//        let imgView = UIImageView(image: img)
//        imgView.contentMode = .scaleAspectFit
//        self.navigationItem.titleView = imgView
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(leftBarButtonItem(_:)))
        self.navigationItem.rightBarButtonItem?.tintColor = .orange
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ViewController {
    @objc func leftBarButtonItem(_ item: UIBarButtonItem) {
        let alert = UIAlertController()
        let rateAction = UIAlertAction(title: "앱 평가하기", style: .default) { action in
            SKStoreReviewController.requestReview()
        }
        let developerInfoAction = UIAlertAction(title: "개발자 소개", style: .default) { action in
            let infoView = self.storyboard?.instantiateViewController(withIdentifier: "DeveloperInfo")
            infoView?.modalTransitionStyle = .coverVertical
            self.present(infoView!, animated: true, completion: nil)
        }
        let alertCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(rateAction)
        alert.addAction(developerInfoAction)
        alert.addAction(alertCancel)
        self.present(alert, animated: true)
    }
}

