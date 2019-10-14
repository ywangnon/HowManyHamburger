//
//  CalorieCell.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/10/13.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit

class CalorieCell: UITableViewCell {

    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var calorieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.setAddSubViews()
        self.setLayouts()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CalorieCell {
    func setViewFoundations() {
        
    }
    
    func setAddSubViews() {
        self.addSubviews([self.nameLabel,
                          self.calorieLabel])
    }
    
    func setLayouts() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.nameLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            self.calorieLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            self.calorieLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -25)
        ])
    }
    
    func setDelegates() {
        
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
}
