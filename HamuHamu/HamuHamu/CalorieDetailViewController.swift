//
//  CalorieDetailViewController.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/10/13.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit

class CalorieDetailViewController: UIViewController {

    var tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(CalorieCell.self, forCellReuseIdentifier: "calorieCell")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    var calorieArray:[[String : Any]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension CalorieDetailViewController {
    func setViewFoundations() {
        
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
    
}

extension CalorieDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calorieArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calorieCell", for: indexPath) as! CalorieCell
        cell.nameLabel.text = ""
        cell.calorieLabel.text = ""
        return cell
    }
    
    
}
