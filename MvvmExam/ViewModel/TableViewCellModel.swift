
//
//  TableViewCellModel.swift
//  MvvmExam
//
//  Created by 김민구 on 09/12/2018.
//  Copyright © 2018 KimMinKu. All rights reserved.
//

import UIKit

// MARK: - Initialize
class TableViewCellModel: TableViewCellPresentation {
    var cellData: AppData
    init(with data: AppData) {
        self.cellData = data
    }
}

extension TableViewCellModel {
    func loadCell(with tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Nib.tableViewCell.rawValue, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.loadCell(model: self)
        return cell
    }
}
