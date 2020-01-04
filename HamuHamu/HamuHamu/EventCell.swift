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
        label.textColor = .black
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
        self.setAddSubViews()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension EventCell {
    func setCell(_ title: String) {
        self.cellTitleLabel.text = title
    }
    
    func setAddSubViews() {
        self.addSubviews([self.cellTitleLabel])
    }
    
    func setLayout() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.cellTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.cellTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.cellTitleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.cellTitleLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            
        ])
    }
}
