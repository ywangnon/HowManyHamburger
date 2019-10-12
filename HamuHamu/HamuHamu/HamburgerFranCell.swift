//
//  HamburgerFranCell.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/10/12.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit

class HamburgerFranCell: UITableViewCell {
    var logoImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HamburgerFranCell {
    func setViewFoundations() {
        self.backgroundColor = .white
    }
    
    func setAddSubViews() {
        self.addSubviews([self.logoImgView,
                          self.nameLabel])
    }
    
    func setLayouts() {
        let safeArea = self.contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.logoImgView.widthAnchor.constraint(equalToConstant: 50),
            self.logoImgView.heightAnchor.constraint(equalToConstant: 50),
            self.logoImgView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25),
            self.logoImgView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.nameLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.logoImgView.trailingAnchor, constant: 25)
        ])
    }
    
    func setDelegates() {
        
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
}
