//
//  TableView + Extension.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 27/03/23.
//

import Foundation
import UIKit


extension UITableView {
    func configureTableView(
        dataSource: UITableViewDataSource?,
        delegate: UITableViewDelegate?,
        separatorStyle: UITableViewCell.SeparatorStyle = .singleLine,
        backgroundColor: UIColor = .white,
        rowHeight: CGFloat = UITableView.automaticDimension,
        estimatedRowHeight: CGFloat = 44,
        allowsSelection: Bool = true,
        registerCells: [(String, AnyClass)] = []
    ) {
        self.dataSource = dataSource
        self.delegate = delegate
        self.separatorStyle = separatorStyle
        self.backgroundColor = backgroundColor
        self.rowHeight = rowHeight
        self.estimatedRowHeight = estimatedRowHeight
        self.allowsSelection = allowsSelection
        self.translatesAutoresizingMaskIntoConstraints = false


    }
}
