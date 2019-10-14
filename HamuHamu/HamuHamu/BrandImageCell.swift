//
//  BrandImageCell.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/10/13.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit

class BrandImageCell: UICollectionViewCell {
    var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setAddSubViews()
        self.setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BrandImageCell {
    func setViewFoundations() {
        
    }
    
    func setAddSubViews() {
        self.addSubviews([self.imgView])
    }
    
    func setLayouts() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.imgView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.imgView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            self.imgView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.imgView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    func setDelegates() {
        
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
}
