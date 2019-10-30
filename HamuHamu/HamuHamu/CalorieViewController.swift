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
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var tableview: UITableView = {
        let tableview = UITableView()
        tableview.separatorStyle = .none
        tableview.register(CalorieCell.self, forCellReuseIdentifier: "calorieCell")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    var calorieObjects: Results<HamburgerCalorie>?

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
                               self.tableview])
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.totalLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.totalLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.totalLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.totalLabel.heightAnchor.constraint(equalToConstant: 70)
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
        do {
            let realm = try Realm()
            
            let object = realm.objects(HamburgerCalorie.self)
            self.calorieObjects = object
        } catch let error {
            print(error)
        }
        print("object", self.calorieObjects)
        self.tableview.reloadData()
    }
    
    func sumCalorie() {
        if let objects = self.calorieObjects {
            var total = 0
            for object in objects {
                total += object.calorie
                print("calorie:::", object.calorie)
                print("sum:::", total)
            }
            self.totalLabel.text = "전체 칼로리: \(total) kcal"
        }
    }
}

extension CalorieViewController: UITableViewDelegate {
    
}

extension CalorieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.calorieObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "calorieCell", for: indexPath) as! CalorieCell
        print("before:::", self.calorieObjects?[indexPath.row])
        if let calorie = self.calorieObjects?[indexPath.row] {
            print("cell calorie::::::",calorie)
            print("name:::", calorie.name)
            print("cal:::", calorie.calorie)
            cell.nameLabel.text = calorie.name
            cell.calorieLabel.text = "\(calorie.calorie) kcal"
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
            
        }
        let burgerkingAction = UIAlertAction(title: "버거킹", style: .default) { (action) in
            
        }
        let lotteriaAction = UIAlertAction(title: "롯데리아", style: .default) { (action) in
            
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
