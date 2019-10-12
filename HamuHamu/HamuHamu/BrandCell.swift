//
//  BrandCell.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 24/09/2019.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit

class BrandCell: UICollectionViewCell {
    var eventAction: (()->Void)?
    var callAction: (()->Void)?
    
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
    
    var eventLabel: UILabel = {
        let label = UILabel()
        label.text = "Event Page"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    var eventButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var callButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setAddSubViews()
        self.setLayouts()
        self.setAddTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        self.setAddSubViews()
        self.setLayouts()
        self.setAddTargets()
    }
}

extension BrandCell {
    func setViewFoundations() {
        
    }
    
    func setAddSubViews() {
        self.addSubview(self.coverView)
        self.coverView.addSubviews([self.imageCoverView,
                                    self.descCoverView,
                                    self.lineView])
        self.imageCoverView.addSubviews([self.imageView,
                                         self.eventLabel])
        self.descCoverView.addSubview(self.descLabel)
        self.addSubviews([self.eventButton,
                          self.callButton])
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
            self.eventLabel.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor),
            self.eventLabel.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor),
            self.eventLabel.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            self.eventLabel.heightAnchor.constraint(equalTo: self.imageView.heightAnchor, multiplier: 1/5)
        ])
        
        NSLayoutConstraint.activate([
            self.descLabel.topAnchor.constraint(equalTo: self.descCoverView.topAnchor),
            self.descLabel.bottomAnchor.constraint(equalTo: self.descCoverView.bottomAnchor),
            self.descLabel.leadingAnchor.constraint(equalTo: self.descCoverView.leadingAnchor),
            self.descLabel.trailingAnchor.constraint(equalTo: self.descCoverView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.eventButton.topAnchor.constraint(equalTo: self.imageCoverView.topAnchor),
            self.eventButton.bottomAnchor.constraint(equalTo: self.imageCoverView.bottomAnchor),
            self.eventButton.leadingAnchor.constraint(equalTo: self.imageCoverView.leadingAnchor),
            self.eventButton.trailingAnchor.constraint(equalTo: self.imageCoverView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.callButton.topAnchor.constraint(equalTo: self.descCoverView.topAnchor),
            self.callButton.bottomAnchor.constraint(equalTo: self.descCoverView.bottomAnchor),
            self.callButton.leadingAnchor.constraint(equalTo: self.descCoverView.leadingAnchor),
            self.callButton.trailingAnchor.constraint(equalTo: self.descCoverView.trailingAnchor)
        ])
    }
    
    func setDelegates() {
        
    }
    
    func setAddTargets() {
        self.eventButton.addTarget(self, action: #selector(event(_:)), for: .touchUpInside)
        self.callButton.addTarget(self, action: #selector(call(_:)), for: .touchUpInside)
    }
    
    func setGestures() {
        
    }
}

extension BrandCell {
    @objc func event(_ sender: UIButton) {
        print("event")
        self.eventAction?()
    }
    
    @objc func call(_ sender: UIButton) {
        print("call")
        self.callAction?()
    }
}
