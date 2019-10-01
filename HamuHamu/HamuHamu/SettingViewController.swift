//
//  SettingViewController.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 28/09/2019.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit
import StoreKit

class SettingViewController: UIViewController {
    let topMenus = ["공지사항"]
    let bottomMenus = ["개발자소개", "앱 평가하기", "버전"]
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MenuCell.self, forCellReuseIdentifier: "menuCell")
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = UIColor.getRGB(red: 135, green: 255, blue: 255, alpha: 0.5)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setDelegates()
        
        self.tableView.tableFooterView = UIView()
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

extension SettingViewController {
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

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                print("공지사항")
                let noticeView = NoticeViewController()
                self.navigationController?.pushViewController(noticeView, animated: true)
            default:
                print("no row")
            }
        case 1:
            switch indexPath.row {
            case 0:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let infoView = storyboard.instantiateViewController(withIdentifier: "DeveloperInfo")
                infoView.title = "About Me"
                self.navigationController?.pushViewController(infoView, animated: true)
            case 1:
                SKStoreReviewController.requestReview()                
            default:
                print("no row")
            }
        default:
            print("no section")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.topMenus.count
        case 1:
            return self.bottomMenus.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        switch indexPath.section {
        case 0:
            cell.titleLabel.text = self.topMenus[indexPath.row]
        case 1:
            cell.titleLabel.text = self.bottomMenus[indexPath.row]
            if self.bottomMenus[indexPath.row] == "버전" {
                cell.trailLabel.text = CommonMethod.shared.appVersion()
            }
        default:
            print("no cell")
        }
        return cell
    }
    
    
}
