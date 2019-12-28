//
//  EventCell.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/12/26.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    var cellTitleLabel: UILabel = {
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

}

extension EventCell {
    func setCell(_ title: String) {
        self.cellTitleLabel.text = title
    }
    
    func setAddSubViews() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.cellTitleLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            self.cellTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
        ])
    }
}
