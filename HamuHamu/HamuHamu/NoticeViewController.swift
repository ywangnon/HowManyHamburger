//
//  NoticeViewController.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 28/09/2019.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit

class NoticeViewController: UIViewController {
    
    var noticeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setText()
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

extension NoticeViewController {
    func setViewFoundations() {
        self.view.backgroundColor = .systemPink
        
        self.navigationItem.title = "Notice"
    }
    
    func setAddSubViews() {
        self.view.addSubviews([self.noticeLabel])
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.noticeLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            self.noticeLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            self.noticeLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.noticeLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            self.noticeLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.8)
        ])
    }
    
    func setDelegates() {
        
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
    
    func setText() {
        let notice = """
            어떤 햄버거가 할인 중인지 궁금하시나요?

            이제는 할인하는 햄버거를 찾아보세요.
            
            햄버거 이벤트 앱이 도와드립니다.

            - 어디 브랜드의 햄버거가 할인 중일까요?
        """
        
        self.noticeLabel.text = notice
    }
}
