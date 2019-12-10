//
//  BrandViewController.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/10/30.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit
import SafariServices
import StoreKit
import NotificationCenter
import Firebase
import FirebaseFirestore

class BrandViewController: UIViewController {
    let brandDic = [["name":"KFC",
                     "logo":UIImage(named: "KFC")!,
                     "image":UIImage(named: "Bannerkfc")!,
                     "images":[UIImage(named: "KFC1"), UIImage(named: "KFC2"), UIImage(named: "KFC3")],
                     "minimum":12000,
                     "call":"1599-8484",
                     "url":Brand.kfc.rawValue,
                     "facebook":BrandFaceBook.kfc.rawValue,
                     "youtube":BrandYoubute.kfc.rawValue],
                    ["name":"McDonal",
                     "logo":UIImage(named: "Mcdonalds")!,
                     "image":UIImage(named: "Bannermacdonalds")!,
                     "images":[UIImage(named: "Mc1"), UIImage(named: "Mc2"), UIImage(named: "Mc3")],
                     "minimum":10000,
                     "call":"1600-5252",
                     "url":Brand.mc.rawValue,
                     "facebook":BrandFaceBook.mc.rawValue,
                     "youtube":BrandYoubute.mc.rawValue],
                    ["name":"BurgerKing",
                     "logo":UIImage(named: "burger-king-logo-png-burger-king-logo-vector-293")!,
                     "image":UIImage(named: "Bannerburgerking")!,
                     "images":[UIImage(named: "King1"), UIImage(named: "King2"), UIImage(named: "King3")],
                     "minimum":11000,
                     "call":"1599-0505",
                     "url":Brand.king.rawValue,
                     "facebook":BrandFaceBook.king.rawValue,
                     "youtube":BrandYoubute.king.rawValue],
                    ["name":"Lotteria",
                     "logo":UIImage(named: "logo-lotteria")!,
                     "image":UIImage(named: "Bannerlotteria")!,
                     "images":[UIImage(named: "Ria1"), UIImage(named: "Ria2"), UIImage(named: "Ria3")],
                     "minimum":11000,
                     "call":"1600-9999",
                     "url":Brand.lotte.rawValue,
                     "facebook":BrandFaceBook.lotte.rawValue,
                     "youtube":BrandYoubute.lotte.rawValue]]
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(HamburgerFranCell.self, forCellReuseIdentifier: "franCell")
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var tabbarController: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setDelegates()
        self.readFirebaseDatabase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override var prefersStatusBarHidden: Bool {
//        return navigationController?.isNavigationBarHidden == true
//    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
}

extension BrandViewController {
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
        self.view.addSubviews([self.tableView])
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
    }
    
    func setDelegates() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
    
    func readFirebaseDatabase() {
        let db = Firestore.firestore()
        db.collection("Franchise").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        
        
    }
}

extension BrandViewController {
    func createTabBarController() {
        self.tabbarController = UITabBarController()
        self.tabbarController.tabBar.barStyle = .blackOpaque
        
        let firstViewController = UIViewController()
        firstViewController.title = "프랜차이즈"
        
        let secondViewController = CalorieViewController()
        secondViewController.title = "칼로리 계산"
        
        self.tabbarController.viewControllers = [firstViewController, secondViewController].map{UINavigationController(rootViewController: $0)}
        self.view.addSubview(self.tabbarController.view)
    }
}

extension BrandViewController {
    @objc func leftBarButtonItem(_ item: UIBarButtonItem) {
        let settingView = SettingViewController()
        settingView.title = "Settings".localized
        self.navigationController?.pushViewController(settingView, animated: true)
        
    }
}

extension BrandViewController {
    @objc func pushKFC() {
        guard let url = URL(string: Brand.kfc.rawValue) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    @objc func pushMcDonald() {
        guard let url = URL(string: Brand.mc.rawValue) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    @objc func pushBurgerKing() {
        guard let url = URL(string: Brand.king.rawValue) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    @objc func pushLotteria() {
        guard let url = URL(string: Brand.lotte.rawValue) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
}

extension BrandViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.brandDic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "franCell", for: indexPath) as! HamburgerFranCell
        cell.bannerImgView.image = self.brandDic[indexPath.row]["image"] as? UIImage
//        cell.logoImgView.image = self.brandDic[indexPath.row]["image"] as? UIImage
        cell.nameLabel.text = self.brandDic[indexPath.row]["name"] as? String
        
        return cell
    }
}

extension BrandViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / CGFloat(self.brandDic.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("touch")
        let detailView = FranDetailViewController()
        detailView.brandImage = self.brandDic[indexPath.row]["logo"] as? UIImage
        detailView.brandName = self.brandDic[indexPath.row]["name"] as? String
        detailView.eventURL = self.brandDic[indexPath.row]["url"] as? String
        detailView.callNumber = self.brandDic[indexPath.row]["call"] as? String
        detailView.facebookURL = self.brandDic[indexPath.row]["facebook"] as? String
        detailView.youtubeURL = self.brandDic[indexPath.row]["youtube"] as? String
        detailView.brandImgs = self.brandDic[indexPath.row]["images"] as? [UIImage]
        self.navigationController?.pushViewController(detailView, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
