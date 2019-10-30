//
//  CalorieDetailViewController.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/10/13.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit
import RealmSwift

class CalorieDetailViewController: UIViewController {

    var tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(CalorieCell.self, forCellReuseIdentifier: "calorieCell")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    var calorieArray:[[String : Any]] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setDelegates()
        // Do any additional setup after loading the view.
    }
}

extension CalorieDetailViewController {
    func setViewFoundations() {
        self.view.backgroundColor = .white
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .white
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
}

extension CalorieDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            let realm = try Realm()
            
            let calorie = HamburgerCalorie("Macdonalds",
                                           self.calorieArray[indexPath.row]["name"] as! String,
                                           self.calorieArray[indexPath.row]["calorie"] as! Int)
            
            try realm.write {
                realm.add(calorie, update: .modified)
            }
        } catch let error {
            print(error)
        }
        self.navigationController?.popViewController(animated: true)
    }
}

extension CalorieDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calorieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calorieCell", for: indexPath) as! CalorieCell
        cell.nameLabel.text = self.calorieArray[indexPath.row]["name"] as? String
        cell.calorieLabel.text = "\(self.calorieArray[indexPath.row]["calorie"] as! Int) cal"
        return cell
    }
    
    
}
