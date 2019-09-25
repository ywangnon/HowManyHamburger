//
//  BrandCell.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 24/09/2019.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit

class BrandCell: UICollectionViewCell {
    var coverView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 10
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imageCoverView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var descCoverView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var descLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

extension BrandCell {
    func setViewFoundations() {
        
    }
    
    func setAddSubViews() {
        self.addSubview(self.coverView)
        self.coverView.addSubview(self.imageCoverView)
        self.coverView.addSubview(self.descCoverView)
        self.coverView.addSubview(self.lineView)
        self.imageCoverView.addSubview(self.imageView)
        self.descCoverView.addSubview(self.descLabel)
    }
    
    func setLayouts() {
        NSLayoutConstraint.activate([
            self.coverView.topAnchor.constraint(equalTo: self.topAnchor),
            self.coverView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.coverView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.coverView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.lineView.leadingAnchor.constraint(equalTo: self.coverView.leadingAnchor),
            self.lineView.trailingAnchor.constraint(equalTo: self.coverView.trailingAnchor),
            self.lineView.centerYAnchor.constraint(equalTo: self.coverView.centerYAnchor),
            self.lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            self.imageCoverView.topAnchor.constraint(equalTo: self.coverView.topAnchor),
            self.imageCoverView.bottomAnchor.constraint(equalTo: self.lineView.topAnchor),
            self.imageCoverView.leadingAnchor.constraint(equalTo: self.coverView.leadingAnchor),
            self.imageCoverView.trailingAnchor.constraint(equalTo: self.coverView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            self.descCoverView.topAnchor.constraint(equalTo: self.lineView.bottomAnchor),
            self.descCoverView.bottomAnchor.constraint(equalTo: self.coverView.bottomAnchor),
            self.descCoverView.leadingAnchor.constraint(equalTo: self.coverView.leadingAnchor),
            self.descCoverView.trailingAnchor.constraint(equalTo: self.coverView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.imageCoverView.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.imageCoverView.bottomAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.imageCoverView.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.imageCoverView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.descLabel.topAnchor.constraint(equalTo: self.descCoverView.topAnchor),
            self.descLabel.bottomAnchor.constraint(equalTo: self.descCoverView.bottomAnchor),
            self.descLabel.leadingAnchor.constraint(equalTo: self.descCoverView.leadingAnchor),
            self.descLabel.trailingAnchor.constraint(equalTo: self.descCoverView.trailingAnchor)
        ])
    }
    
    func setDelegates() {
        
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
}
