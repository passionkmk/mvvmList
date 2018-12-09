//
//  CellProtocol.swift
//  MvvmExam
//
//  Created by 김민구 on 09/12/2018.
//  Copyright © 2018 KimMinKu. All rights reserved.
//

import UIKit

protocol CellPresentation {
    var cellData: AppData { get }
}

protocol TableViewCellPresentation: CellPresentation {
    func loadCell(with tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

protocol CollectionViewCellPresentation: CellPresentation {
    func loadCell(with collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
