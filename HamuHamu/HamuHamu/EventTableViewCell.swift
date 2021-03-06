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
            self.brandLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
            self.brandLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 4),
        ])
        
        NSLayoutConstraint.activate([
            self.eventImgView.topAnchor.constraint(equalTo: self.brandLabel.bottomAnchor, constant: 4),
            self.eventImgView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.eventImgView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.eventImgView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            self.eventTitleLabel.topAnchor.constraint(equalTo: self.eventImgView.bottomAnchor, constant: 4),
            self.eventTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            self.eventStartDayLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
            self.eventStartDayLabel.topAnchor.constraint(equalTo: self.eventStartDayLabel.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            self.eventEndDayLabel.leadingAnchor.constraint(equalTo: self.eventStartDayLabel.trailingAnchor),
            self.eventEndDayLabel.centerYAnchor.constraint(equalTo: self.eventStartDayLabel.centerYAnchor)
        ])
    }
}
