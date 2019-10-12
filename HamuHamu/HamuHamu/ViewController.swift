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
    
//    var kfcLogo = UIImage(named: "KFC_title")
//    var mcdonaldsLogo = UIImage(named: "mcdonalds_title")
//    var burgerkingLogo = UIImage(named: "burgerking_title")
//    var lotteria = UIImage(named: "lotteria_title")
    
    let brandDic = [["name":"KFC",
//                     "name":"KFC\n\n추천메뉴\n\n징거버거세트, 타워버거박스\n\n☏ 전화",
                     "image":UIImage(named: "KFC")!,
                     "minimum":12000,
                     "call":"1599-8484",
                     "url":Brand.kfc.rawValue,
                     "facebook":BrandFaceBook.kfc.rawValue,
                     "youtube":BrandYoubute.kfc.rawValue],
                    ["name":"McDonal",
//                     "name":"McDonal's\n\n추천메뉴\n\n더블불고기버거, 1955버거\n\n☏ 전화",
                     "image":UIImage(named: "Mcdonalds")!,
                     "minimum":10000,
                     "call":"1600-5252",
                     "url":Brand.mc.rawValue,
                     "facebook":BrandFaceBook.mc.rawValue,
                     "youtube":BrandYoubute.mc.rawValue],
                    ["name":"BurgerKing",
//                     "name":"BurgerKing\n\n추천메뉴\n\n콰트로치즈와퍼, 와퍼세트\n\n☏ 전화",
                     "image":UIImage(named: "burger-king-logo-png-burger-king-logo-vector-293")!,
                     "minimum":11000,
                     "call":"1599-0505",
                     "url":Brand.king.rawValue,
                     "facebook":BrandFaceBook.king.rawValue,
                     "youtube":BrandYoubute.king.rawValue],
                    ["name":"Lotteria",
//                     "name":"Lotteria\n\n추천메뉴\n\n데리버거, 새우버거, 불고기버거\n\n☏ 전화",
                     "image":UIImage(named: "logo-lotteria")!,
                     "minimum":11000,
                     "call":"1600-9999",
                     "url":Brand.lotte.rawValue,
                     "facebook":BrandFaceBook.lotte.rawValue,
                     "youtube":BrandYoubute.lotte.rawValue]]
    
    var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.backgroundColor = .white
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(HamburgerFranCell.self, forCellReuseIdentifier: "franCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
//    var collectionView: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        collectionView.register(BrandCell.self, forCellWithReuseIdentifier: "brandCell")
//        collectionView.register(FranchiseCell.self, forCellWithReuseIdentifier: "franCell")
//        collectionView.backgroundColor = .white
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.isPagingEnabled = true
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        return collectionView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
    override var prefersStatusBarHidden: Bool {
        return navigationController?.isNavigationBarHidden == true
    }

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
//        self.view.addSubviews([self.collectionView,
//                               self.imageView])
        self.view.addSubviews([self.tableView,
                               self.imageView])
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
//        NSLayoutConstraint.activate([
//            self.collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
//            self.collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
//            self.collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
//            self.collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
//        ])
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
    func setDelegates() {
        self.imageView.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.collectionView.delegate = self
//        self.collectionView.dataSource = self
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
}

extension ViewController {
    @objc func leftBarButtonItem(_ item: UIBarButtonItem) {
        let settingView = SettingViewController()
        settingView.title = "Settings".localized
        self.navigationController?.pushViewController(settingView, animated: true)
        
    }
}

extension ViewController {
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

extension ViewController: SwiftyGifDelegate {
    func gifURLDidFinish(sender: UIImageView) {
        print("gifURLDidFinish")
    }

    func gifURLDidFail(sender: UIImageView) {
        print("gifURLDidFail")
    }

    func gifDidStart(sender: UIImageView) {
        print("gifDidStart")
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func gifDidLoop(sender: UIImageView) {
        print("gifDidLoop")
    }
    
    func gifDidStop(sender: UIImageView) {
        print("gifDidStop")
        self.navigationController?.navigationBar.isHidden = false
        self.imageView.isHidden = true
        CommonMethod.shared.notificationSetting()
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else if section == 1 {
            return self.brandDic.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "franCell", for: indexPath) as! HamburgerFranCell
        if indexPath.section == 0 {
            
        } else {
            cell.logoImgView.image = self.brandDic[indexPath.row]["image"] as? UIImage
            cell.nameLabel.text = self.brandDic[indexPath.row]["name"] as? String
            print(self.brandDic[indexPath.row]["name"] as? String)
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = String()
        if section == 0 {
            title = "프랜차이즈"
        } else if section == 1 {
            title = "전체"
        }
        return title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = FranDetailViewController()
        detailView.logoImageView.image = self.brandDic[indexPath.row]["image"] as? UIImage
        detailView.title = self.brandDic[indexPath.row]["name"] as? String
        detailView.eventURL = self.brandDic[indexPath.row]["url"] as? String
        detailView.callNumber = self.brandDic[indexPath.row]["call"] as? String
        detailView.facebookURL = self.brandDic[indexPath.row]["facebook"] as? String
        detailView.youtubeURL = self.brandDic[indexPath.row]["youtube"] as? String
        self.navigationController?.pushViewController(detailView, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//extension ViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch indexPath.row {
//        case 0:
//            self.pushKFC()
//        case 1:
//            self.pushMcDonald()
//        case 2:
//            self.pushBurgerKing()
//        case 3:
//            self.pushLotteria()
//        default:
//            print("error")
//        }
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.collectionView.frame.width - 10, height: self.collectionView.frame.height - 10)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
//    }
//}

//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.brandDic.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCell", for: indexPath) as! BrandCell
//        cell.imageView.image = self.brandDic[indexPath.row]["image"] as? UIImage
//        cell.descLabel.text = self.brandDic[indexPath.row]["name"] as? String
//        cell.eventAction = { () in
//            print("event in VC")
//            guard let url = URL(string: self.brandDic[indexPath.row]["url"] as! String) else { return }
//
//            let safariViewController = SFSafariViewController(url: url)
//            self.present(safariViewController, animated: true, completion: nil)
//        }
//        cell.callAction = { () in
//            print("call in VC")
//            let urlString = "tel://" + (self.brandDic[indexPath.row]["call"] as! String)
//            if let numberURL = URL(string: urlString) {
//                let application:UIApplication = UIApplication.shared
//                if (application.canOpenURL(numberURL)) {
//                    application.open(numberURL, options: [:], completionHandler: nil)
//                }
//            }
//        }
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "franCell", for: indexPath) as! FranchiseCell
//        cell.logoView.image = self.brandDic[indexPath.row]["image"] as? UIImage
//        cell.titleLabel.text = self.brandDic[indexPath.row]["name"] as? String
//        cell.eventPageURL = self.brandDic[indexPath.row]["url"] as? String
//
//        cell.callAction = { () in
//            print("call in VC")
//            let urlString = "tel://" + (self.brandDic[indexPath.row]["call"] as! String)
//            if let numberURL = URL(string: urlString) {
//                let application:UIApplication = UIApplication.shared
//                if (application.canOpenURL(numberURL)) {
//                    application.open(numberURL, options: [:], completionHandler: nil)
//                }
//            }
//        }
//
//        cell.reloadCell()
//
//        return cell
//    }
//}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//
//}
