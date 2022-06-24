//
//  ActivitiesView.swift
//  notbored
//
//  Created by Douglas Biagi Grana on 22/06/22.
//

import UIKit

class ActivitiesView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(ActivitiesTableViewCell.self, forCellReuseIdentifier: ActivitiesTableViewCell.identifier)
        return tableView
    }()
    
    public func configTableViewDelegates(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubview(tableView)
    }
    
    private func setUpConstraints() {
        tableView.pinView(to: self)
    }
}
