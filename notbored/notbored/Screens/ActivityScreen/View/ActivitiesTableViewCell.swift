//
//  ActivitiesTableViewCell.swift
//  notbored
//
//  Created by Douglas Biagi Grana on 22/06/22.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    static let identifier: String = "ActivitiesTableViewCell"
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubview(categoryLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
        ])
    }
}
