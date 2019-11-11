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
import SwiftyGif
import NotificationCenter

class ViewController: UIViewController {
    
    var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.backgroundColor = .white
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var tabbarController: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createTabBarController()
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setDelegates()
        
        do {
            let gif = try UIImage(gifName: "intro.gif")
            self.imageView.setGifImage(gif, loopCount: 1)
        } catch {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
//    override var prefersStatusBarHidden: Bool {
//        return navigationController?.isNavigationBarHidden == true
//    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
}

extension ViewController {
    func setViewFoundations() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.barStyle = .black
        
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(leftBarButtonItem(_:)))
        self.navigationItem.rightBarButtonItem?.tintColor = .yellow
    }
    
    func setAddSubViews() {
        self.view.addSubviews([self.imageView])
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
    func setDelegates() {
        self.imageView.delegate = self
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
}

extension ViewController {
    func createTabBarController() {
        self.tabbarController = UITabBarController()
        self.tabbarController.tabBar.barStyle = .blackOpaque
        
        let firstViewController = BrandViewController()
        firstViewController.title = "프랜차이즈"
        
        let secondViewController = CalorieViewController()
        secondViewController.title = "칼로리 계산"
        
        self.tabbarController.viewControllers = [firstViewController, secondViewController].map{UINavigationController(rootViewController: $0)}
        self.view.addSubview(self.tabbarController.view)
    }
}

extension ViewController {
    @objc func leftBarButtonItem(_ item: UIBarButtonItem) {
        let settingView = SettingViewController()
        settingView.title = "Settings".localized
        self.navigationController?.pushViewController(settingView, animated: true)
        
    }
}

extension ViewController: SwiftyGifDelegate {
    func gifURLDidFinish(sender: UIImageView) {
        print("gifURLDidFinish")
    }
    
    func gifURLDidFail(sender: UIImageView) {
        print("gifURLDidFail")
    }
    
    func gifDidStart(sender: UIImageView) {
        print("gifDidStart")
//        self.navigationController?.navigationBar.isHidden = true
    }
    
    func gifDidLoop(sender: UIImageView) {
        print("gifDidLoop")
    }
    
    func gifDidStop(sender: UIImageView) {
        print("gifDidStop")
//        self.navigationController?.navigationBar.isHidden = false
        self.imageView.isHidden = true
        CommonMethod.shared.notificationSetting()
        
    }
}
