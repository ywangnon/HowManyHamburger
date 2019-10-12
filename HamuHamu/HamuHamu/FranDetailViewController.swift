//
//  FranDetailViewController.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/10/12.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit
import SafariServices

class FranDetailViewController: UIViewController {
    var callNumber: String?
    var facebookURL: String?
    var youtubeURL: String?
    var eventURL: String?
    
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
//        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.getRGB(red: 240, green: 240, blue: 240).cgColor
        button.layer.borderWidth = 1
        button.setTitle("☏ call", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var facebookButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.getRGB(red: 240, green: 240, blue: 240).cgColor
        button.layer.borderWidth = 1
        button.setTitle("ⓕ facebook", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var youtubeButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.getRGB(red: 240, green: 240, blue: 240).cgColor
        button.layer.borderWidth = 1
        button.setTitle("▶︎ youtube", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var eventWebViewButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("할인 이벤트 페이지", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setAddTargets()
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
    func setViewFoundations() {
        self.view.backgroundColor = .white
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func setAddSubViews() {
        self.view.addSubviews([self.logoImageView,
                               self.buttonsView,
                               self.eventWebViewButton])
        self.buttonsView.addSubviews([self.callButton,
                                      self.facebookButton,
                                      self.youtubeButton])
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            self.logoImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.logoImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.logoImageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 1/7)
        ])
        
        NSLayoutConstraint.activate([
            self.buttonsView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor),
            self.buttonsView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.buttonsView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.buttonsView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 1/8)
        ])
        
        NSLayoutConstraint.activate([
            self.callButton.heightAnchor.constraint(equalTo: self.buttonsView.heightAnchor, multiplier: 0.5),
            self.callButton.widthAnchor.constraint(equalTo: self.buttonsView.widthAnchor, multiplier: 0.9 * 0.33),
            self.callButton.centerYAnchor.constraint(equalTo: self.buttonsView.centerYAnchor),
            self.callButton.leadingAnchor.constraint(equalTo: self.buttonsView.leadingAnchor, constant: (safeArea.layoutFrame.width - 2) * 0.1 * 0.5)
        ])
        
        NSLayoutConstraint.activate([
            self.facebookButton.leadingAnchor.constraint(equalTo: self.callButton.trailingAnchor, constant: 1),
            self.facebookButton.topAnchor.constraint(equalTo: self.callButton.topAnchor),
            self.facebookButton.bottomAnchor.constraint(equalTo: self.callButton.bottomAnchor),
            self.facebookButton.widthAnchor.constraint(equalTo: self.callButton.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.youtubeButton.leadingAnchor.constraint(equalTo: self.facebookButton.trailingAnchor, constant: 1),
            self.youtubeButton.topAnchor.constraint(equalTo: self.callButton.topAnchor),
            self.youtubeButton.bottomAnchor.constraint(equalTo: self.callButton.bottomAnchor),
            self.youtubeButton.widthAnchor.constraint(equalTo: self.callButton.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.eventWebViewButton.topAnchor.constraint(equalTo: self.buttonsView.bottomAnchor, constant: 10),
            self.eventWebViewButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            self.eventWebViewButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            self.eventWebViewButton.heightAnchor.constraint(equalToConstant: 50)
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
        if let stringURL = self.eventURL,
            let url = URL(string: stringURL) {
            let safariViewController = SFSafariViewController(url: url)
            self.present(safariViewController, animated: true, completion: nil)
        }
    }
}
