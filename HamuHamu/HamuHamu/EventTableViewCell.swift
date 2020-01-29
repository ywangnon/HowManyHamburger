//
//  EventTableViewCell.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2020/01/24.
//  Copyright © 2020 hansub yoo. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    var brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var eventImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var eventTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var eventStartDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var eventEndDayLabel: UILabel = {
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

extension EventTableViewCell {
    func setCell(_ title: String) {
        
    }
    
    func setAddSubViews() {
        self.addSubviews([
            self.brandLabel,
            self.eventImgView,
            self.eventTitleLabel,
            self.eventStartDayLabel,
            self.eventEndDayLabel
        ])
    }
    
    func setLayout() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.brandLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            self.brandLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5),
        ])
        
        NSLayoutConstraint.activate([
            self.eventImgView.topAnchor.constraint(equalTo: self.brandLabel.bottomAnchor, constant: 5),
            self.eventImgView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.eventImgView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.eventImgView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
