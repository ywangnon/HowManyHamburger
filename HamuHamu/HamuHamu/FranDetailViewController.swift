//
//  FranDetailViewController.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/10/12.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit
import SafariServices
import FirebaseFirestore

class FranDetailViewController: UIViewController {
    var callNumber: String?
    var facebookURL: String?
    var youtubeURL: String?
    var eventURL: String?
    var brandImage: UIImage?
    var brandImgs: [UIImage]?
    var brandName: String?
    
    var backgroundImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var brandNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .yellow
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var logoImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var buttonsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var callButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.layer.borderColor = UIColor.getRGB(red: 240, green: 240, blue: 240).cgColor
        button.layer.borderWidth = 1
        button.setTitle("☏", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var facebookButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.borderColor = UIColor.getRGB(red: 240, green: 240, blue: 240).cgColor
        button.layer.borderWidth = 1
        button.setTitle("ⓕ", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var youtubeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.borderColor = UIColor.getRGB(red: 240, green: 240, blue: 240).cgColor
        button.layer.borderWidth = 1
        button.setTitle("▶︎", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var eventWebViewButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .systemOrange
//        button.layer.cornerRadius = 10
//        button.layer.borderColor = UIColor.black.cgColor
//        button.layer.borderWidth = 1
//        button.setTitle("promotion page", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNavigationTitle()
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setAddTargets()
        self.backgroundIMGSetting()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FranDetailViewController {
    func setNavigationTitle() {
        let height = self.navigationController?.navigationBar.frame.height
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        let titleImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        titleImgView.image = self.brandImage
        titleImgView.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = titleView
        titleView.addSubview(titleImgView)
        titleImgView.center = titleView.center
        
        self.brandNameLabel.text = self.brandName
        // titleImageView를 직접 titleView에 넣으면 문제가 생긴다.
    }
    
    func setViewFoundations() {
        self.view.backgroundColor = .white
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .yellow
    }
    
    func setAddSubViews() {
        self.view.addSubviews([self.backgroundImgView,
//                               self.logoImageView,
                               self.buttonsView,
                               self.brandNameLabel])
        self.buttonsView.addSubviews([
//            self.callButton,
//            self.facebookButton,
            self.eventWebViewButton
//            self.youtubeButton
        ])
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.backgroundImgView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.backgroundImgView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.backgroundImgView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.backgroundImgView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.25)
        ])
        
        NSLayoutConstraint.activate([
            self.brandNameLabel.leadingAnchor.constraint(equalTo: self.backgroundImgView.leadingAnchor, constant: 20),
            self.brandNameLabel.bottomAnchor.constraint(equalTo: self.backgroundImgView.bottomAnchor, constant: -10)
        ])
        
//        NSLayoutConstraint.activate([
//            self.logoImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
//            self.logoImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
//            self.logoImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
//            self.logoImageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 1/7)
//        ])
//
        NSLayoutConstraint.activate([
            self.buttonsView.topAnchor.constraint(equalTo: self.backgroundImgView.bottomAnchor),
            self.buttonsView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.buttonsView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.buttonsView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
//        let width = safeArea.layoutFrame.width > safeArea.layoutFrame.height * 0.75 ? safeArea.layoutFrame.height * 0.75 * 0.25 : safeArea.layoutFrame.width * 0.25
//        let widthMargin = (safeArea.layoutFrame.width - (2 * width)) / 4
//        let heightMargin = ((safeArea.layoutFrame.height * 0.75) - (2 * width)) / 4
//
//
//        NSLayoutConstraint.activate([
//            self.callButton.heightAnchor.constraint(equalToConstant: width),
//            self.callButton.widthAnchor.constraint(equalToConstant: width),
//            self.callButton.leadingAnchor.constraint(equalTo: self.buttonsView.leadingAnchor, constant: widthMargin),
//            self.callButton.topAnchor.constraint(equalTo: self.buttonsView.topAnchor, constant: heightMargin)
//        ])
//
//        NSLayoutConstraint.activate([
//            self.facebookButton.heightAnchor.constraint(equalToConstant: width),
//            self.facebookButton.widthAnchor.constraint(equalToConstant: width),
//            self.facebookButton.trailingAnchor.constraint(equalTo: self.buttonsView.trailingAnchor, constant: -widthMargin),
//            self.facebookButton.topAnchor.constraint(equalTo: self.buttonsView.topAnchor, constant: heightMargin),
//        ])
//
//        NSLayoutConstraint.activate([
//            self.youtubeButton.heightAnchor.constraint(equalToConstant: width),
//            self.youtubeButton.widthAnchor.constraint(equalToConstant: width),
//            self.youtubeButton.leadingAnchor.constraint(equalTo: self.buttonsView.leadingAnchor, constant: widthMargin),
//            self.youtubeButton.bottomAnchor.constraint(equalTo: self.buttonsView.bottomAnchor, constant: -heightMargin)
//        ])
        
        NSLayoutConstraint.activate([
            self.eventWebViewButton.leadingAnchor.constraint(equalTo: self.backgroundImgView.leadingAnchor),
            self.eventWebViewButton.trailingAnchor.constraint(equalTo: self.backgroundImgView.trailingAnchor),
            self.eventWebViewButton.topAnchor.constraint(equalTo: self.backgroundImgView.topAnchor),
            self.eventWebViewButton.bottomAnchor.constraint(equalTo: self.backgroundImgView.bottomAnchor)
        ])
    }
    
    func setDelegates() {
        
    }
    
    func setAddTargets() {
        self.callButton.addTarget(self, action: #selector(callFranchise), for: .touchUpInside)
        self.facebookButton.addTarget(self, action: #selector(moveToFaceBook), for: .touchUpInside)
        self.youtubeButton.addTarget(self, action: #selector(moveToYoutube), for: .touchUpInside)
        self.eventWebViewButton.addTarget(self, action: #selector(moveToEventPage), for: .touchUpInside)
    }
    
    func setGestures() {
        
    }
    
    func readFirebaseDatabase() {
        let db = Firestore.firestore()
        db.collection("Event").getDocuments { (querySnapshot, err) in
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

extension FranDetailViewController {
    @objc func callFranchise() {
        if let phone = self.callNumber {
            let urlString = "tel://" + phone
            if let numberURL = URL(string: urlString) {
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(numberURL)) {
                    application.open(numberURL, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    @objc func moveToFaceBook() {
        if let stringURL = self.facebookURL,
            let url = URL(string: stringURL),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func moveToYoutube() {
        if let stringURL = self.youtubeURL,
            let url = URL(string: stringURL),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func moveToEventPage() {
        if let stringURL = self.eventURL {
            let webviewVC = EventWebView(stringURL)
            webviewVC.title = self.title
            self.navigationController?.pushViewController(webviewVC, animated: true)
        }
    }
}

extension FranDetailViewController {
    func backgroundIMGSetting() {
        if let imgs:[UIImage] = self.brandImgs {
            self.backgroundImgView.animationImages = imgs
            self.backgroundImgView.animationDuration = 10
            self.backgroundImgView.startAnimating()
        }
    }
}
