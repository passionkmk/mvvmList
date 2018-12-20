//
//  CollectionViewCellModel.swift
//  MvvmExam
//
//  Created by 김민구 on 09/12/2018.
//  Copyright © 2018 KimMinKu. All rights reserved.
//

import UIKit

// MARK: - Initialize
class CollectionViewCellModel: CollectionViewCellPresentation {
    var cellData: AppData
    init(with data: AppData) {
        self.cellData = data
    }
}

extension CollectionViewCellModel {
    func loadCell(with collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReuseableCell(ofType: CollectionViewCell.self, for: indexPath)
        cell.loadCell(model: self)
        return cell
    }
}
