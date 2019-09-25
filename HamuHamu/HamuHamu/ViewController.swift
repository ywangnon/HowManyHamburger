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

class ViewController: UIViewController {
    
    var kfcLogo = UIImage(named: "KFC_title")
    var mcdonaldsLogo = UIImage(named: "mcdonalds_title")
    var burgerkingLogo = UIImage(named: "burgerking_title")
    var lotteria = UIImage(named: "lotteria_title")
    
    let brandDic = [["name":"KFC\n\n추천메뉴\n\n징거버거세트, 타워버거박스",
                     "image":UIImage(named: "KFC_title")],
                    ["name":"McDonal's\n\n추천메뉴\n\n더블불고기버거, 1955버거",
                     "image":UIImage(named: "mcdonalds_title")],
                    ["name":"BurgerKing\n\n추천메뉴\n\n콰트로치즈와퍼, 와퍼세트",
                     "image":UIImage(named: "burgerking_title")],
                    ["name":"Lotteria\n\n추천메뉴\n\n데리버거, 새우버거, 불고기버거",
                     "image":UIImage(named: "lotteria_title")]]
    
    var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(BrandCell.self, forCellWithReuseIdentifier: "brandCell")
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ViewController {
    func setViewFoundations() {
        self.view.backgroundColor = .white
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(leftBarButtonItem(_:)))
        self.navigationItem.rightBarButtonItem?.tintColor = .orange
    }
    
    func setAddSubViews() {
        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.imageView)
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
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
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
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
    }
    
    func gifDidLoop(sender: UIImageView) {
        print("gifDidLoop")
    }
    
    func gifDidStop(sender: UIImageView) {
        print("gifDidStop")
        self.navigationController?.navigationBar.isHidden = false
        self.imageView.isHidden = true
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.pushKFC()
        case 1:
            self.pushMcDonald()
        case 2:
            self.pushBurgerKing()
        case 3:
            self.pushLotteria()
        default:
            print("error")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width - 10, height: self.collectionView.frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.brandDic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCell", for: indexPath) as! BrandCell
        print("image:::", self.brandDic[indexPath.row]["image"] as? UIImage)
        print("name:::", self.brandDic[indexPath.row]["name"] as? String)
        cell.imageView.image = self.brandDic[indexPath.row]["image"] as? UIImage
        cell.descLabel.text = self.brandDic[indexPath.row]["name"] as? String
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
