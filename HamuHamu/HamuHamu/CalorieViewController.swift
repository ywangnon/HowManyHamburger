//
//  CalorieViewController.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/10/13.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit
import RealmSwift

class CalorieViewController: UIViewController {
    
    var totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var totalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .getRGB(red: 94, green: 94, blue: 90, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var tableview: UITableView = {
        let tableview = UITableView()
        tableview.separatorStyle = .none
        tableview.register(CalorieCell.self, forCellReuseIdentifier: "calorieCell")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    //    var calorieObjects: Results<HamburgerCalorie>?
    var calories: [[String:Any]]?
    
    override func viewWillAppear(_ animated: Bool) {
        self.setResult()
        self.sumCalorie()
        self.view.setNeedsLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setDelegates()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override var prefersStatusBarHidden: Bool {
        return navigationController?.isNavigationBarHidden == true
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
}

extension CalorieViewController {
    func setViewFoundations() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.barStyle = .black
        
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(leftBarButtonItem(_:)))
        self.navigationItem.rightBarButtonItem?.tintColor = .yellow
    }
    
    func setAddSubViews() {
        self.view.addSubviews([self.totalLabel,
                               self.totalLineView,
                               self.tableview])
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.totalLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.totalLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            self.totalLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.totalLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            self.totalLineView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.totalLineView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.totalLineView.bottomAnchor.constraint(equalTo: totalLabel.bottomAnchor),
            self.totalLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            self.tableview.topAnchor.constraint(equalTo: self.totalLabel.bottomAnchor),
            self.tableview.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.tableview.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    func setDelegates() {
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
}

extension CalorieViewController {
    func setResult() {
        //        do {
        //            let realm = try Realm()
        //
        //            let object = realm.objects(HamburgerCalorie.self)
        //            self.calorieObjects = object
        //        } catch let error {
        //            print(error)
        //        }
        self.calories = totalCalories
        
        self.tableview.reloadData()
    }
    
    func sumCalorie() {
        //        if let objects = self.calorieObjects {
        //            var total = 0
        //            for object in objects {
        //                total += object.calorie
        //                print("calorie:::", object.calorie)
        //                print("sum:::", total)
        //            }
        //            self.totalLabel.text = "전체 칼로리: \(total) kcal"
        //        }
        
        var total = 0
        if let calories = self.calories {
            for hamburger in calories {
                if let calorie = hamburger["calorie"] as? Int {
                    total += calorie
                }
            }
        }
        self.totalLabel.text = "전체 칼로리: \(total) kcal"
    }
}

extension CalorieViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let deleteAction = UITableViewRowAction(style: .destructive, title: "삭제") { (action, index) in
//            totalCalories?.remove(at: index.row)
//        }
//        
//        return [deleteAction]
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            totalCalories?.remove(at: indexPath.row)
        }
        DispatchQueue.main.async {
            self.setResult()
            self.sumCalorie()
            self.tableview.reloadData()
        }
    }
}

extension CalorieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number table")
        return self.calories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "calorieCell", for: indexPath) as! CalorieCell
        cell.backgroundColor = .white
        
        if let hamburger = self.calories?[indexPath.row],
            let name = hamburger["name"] as? String,
            let calorie = hamburger["calorie"] as? Int {
            cell.nameLabel.text = name
            cell.calorieLabel.text = "\(calorie) kcal"
        }
        return cell
    }
}

extension CalorieViewController {
    @objc func leftBarButtonItem(_ item: UIBarButtonItem) {
        let alrertController = UIAlertController(title: "프랜차이즈", message: "프랜차이즈를 선택하세요.", preferredStyle: .actionSheet)
        let mcdonaldsAction = UIAlertAction(title: "맥도날드", style: .default) { (action) in
            let detailView = CalorieDetailViewController()
            detailView.title = "맥도날드"
            detailView.calorieArray = McdonaldsCalorie
            self.navigationController?.pushViewController(detailView, animated: true)
        }
        
        let kfcAction = UIAlertAction(title: "KFC", style: .default) { (action) in
            let detailView = CalorieDetailViewController()
            detailView.title = "KFC"
            detailView.calorieArray = KFCCalorie
            self.navigationController?.pushViewController(detailView, animated: true)
        }
        let burgerkingAction = UIAlertAction(title: "버거킹", style: .default) { (action) in
            let detailView = CalorieDetailViewController()
            detailView.title = "버거킹"
            detailView.calorieArray = BurgerKingCalorie
            self.navigationController?.pushViewController(detailView, animated: true)
        }
        let lotteriaAction = UIAlertAction(title: "롯데리아", style: .default) { (action) in
            let detailView = CalorieDetailViewController()
            detailView.title = "롯데리아"
            detailView.calorieArray = LotteriaCalorie
            self.navigationController?.pushViewController(detailView, animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (action) in
            
        }
        
        alrertController.addAction(mcdonaldsAction)
        alrertController.addAction(kfcAction)
        alrertController.addAction(burgerkingAction)
        alrertController.addAction(lotteriaAction)
        alrertController.addAction(cancelAction)
        self.present(alrertController, animated: true, completion: nil)
    }
}
