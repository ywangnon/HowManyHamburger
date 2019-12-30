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
    var eventArr = [[String:Any]]()
    
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
    
    var eventList: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        self.setBrandEvent()
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
        self.view.addSubviews([
            self.backgroundImgView,
            self.brandNameLabel,
            self.eventWebViewButton,
            self.eventList
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
        
        NSLayoutConstraint.activate([
            self.eventWebViewButton.leadingAnchor.constraint(equalTo: self.backgroundImgView.leadingAnchor),
            self.eventWebViewButton.trailingAnchor.constraint(equalTo: self.backgroundImgView.trailingAnchor),
            self.eventWebViewButton.topAnchor.constraint(equalTo: self.backgroundImgView.topAnchor),
            self.eventWebViewButton.bottomAnchor.constraint(equalTo: self.backgroundImgView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.eventList.topAnchor.constraint(equalTo: backgroundImgView.bottomAnchor),
            self.eventList.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            self.eventList.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.eventList.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
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
    
    func setBrandEvent() {
        guard let brand = self.brandName else {
            return
        }
        
        switch brand {
        case "KFC":
            self.readFirebaseDatabase("KFC_Event")
        case "McDonal":
            self.readFirebaseDatabase("Macdonalds_Event")
        case "BurgerKing":
            self.readFirebaseDatabase("BurgerKing_Event")
        case "Lotteria":
            self.readFirebaseDatabase("Lotteria_Event")
        default:
            print("anyone")
        }
    }
    
    func readFirebaseDatabase(_ collection: String) {
        let db = Firestore.firestore()
        db.collection(collection).getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let title = document.data()["title"] as? String
                    let startDay = document.data()["dateStart"] as? Date
                    let endDay = document.data()["dateEnd"] as? Date
                    let arr: [String : Any] = ["title":title,
                                               "startDay":startDay,
                                               "endDay":endDay]
                    self.eventArr.append(arr)
                    
                    // Firebase 작업중
                    /*
                     Firebase 구조가 어려워서 진척이 안되고 있음.
                     - 내가 원하는 구조
                     Event [
                        Macdonalds [
                            ["title":...,"date":...,"body":...],
                            ["title":...,"date":...,"body":...],
                            ["title":...,"date":...,"body":...]
                        ],
                        KFC [
                            ["title":...,"date":...,"body":...],
                            ["title":...,"date":...,"body":...],
                            ["title":...,"date":...,"body":...]
                        ],
                        ...
                     ]
                     - Firestore
                     Event [
                        Macdonalds [
                            field:body,
                            field:body,
                            field:body
                        ]
                     ]
                     
                     * 브랜드에 필드값을 필수로 적어야하기 떄문에 만들기 애매하다.
                     그냥 배열로 만들려고 해도 필드값이 필수고, 참조로 해도 참조하는 컬렉션도 결국 필드값을 만들어줘야한다.
                     현재 고민중...
                     
                     12.16.2019
                     각각의 프랜차이즈 이벤트를 컬렉션으로 만들고, 프랜차이즈 컬렉션에서 각각의 브랜드에 이벤트 배열을 반들어 참조시킴.
                     참조 문구
                     <FIRDocumentReference: 0x281a382d0>,
                     <FIRDocumentReference: 0x281a38300>
                     이상하게 나옴.
                     
                     Firebase Document Reference 타입으로 변수를 만들어서 넣어보기.
                     
                     12/21
                     - 일단 if 문으로 걸러서 각각의 collection을 읽어오게 하기
                     */
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
