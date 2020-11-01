//
//  ListFollowerView.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 10/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import UIKit

class ListFollowerView: ReusableUIView {
    
    
    // MARK: - IBOutlet
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: Constant.Colors.backgroundMainView)!
        return tableView
    }()
    
    // MARK: - Styling
    override func styleUI() {
        backgroundColor = UIColor(named: Constant.Colors.backgroundMainView)
    }
    
    // MARK: - Constraints
    override func makeConstraints() {
        
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: safeArea.heightAnchor),
        ])
        
    }
    
    // MARK: - setupUI
    override func setupUI() {
        addSubview(tableView)
    }
    
    // MARK: - configUI
    override func configUI() {
        // register a defalut cell
        self.tableView.register(ListFollowersTableViewCell.self, forCellReuseIdentifier: ListFollowersTableViewCell.identifier)
        self.tableView.rowHeight = 100
    }
    
    
    
}
