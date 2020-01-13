//
//  EventCell.swift
//  HamuHamu
//
//  Created by Hansub Yoo on 2019/12/26.
//  Copyright © 2019 hansub yoo. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    var brandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var eventNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var eventImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setAddSubViews()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension EventCell {
    func setCell(_ title: String) {
        self.eventNameLabel.text = title
    }
    
    func setAddSubViews() {
        self.addSubviews([
            self.brandLabel,
            self.eventImageView,
            self.eventNameLabel,
            self.eventStartDayLabel,
            self.eventEndDayLabel
        ])
    }
    
    func setLayout() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.eventNameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.eventNameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.eventNameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.eventNameLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}
