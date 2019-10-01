//
//  MenuCell.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 28/09/2019.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var trailLabel: UILabel = {
        let label = UILabel()
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
        
        self.setAddSubViews()
        self.setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MenuCell {
    func setViewFoundations() {
        
    }
    
    func setAddSubViews() {
        self.contentView.addSubviews([self.titleLabel,
                                      self.trailLabel])
    }
    
    func setLayouts() {
        let safeArea = self.contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.titleLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            self.trailLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            self.trailLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15)
        ])
    }
    
    func setDelegates() {
        
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
}
