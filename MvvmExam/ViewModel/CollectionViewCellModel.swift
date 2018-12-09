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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Nib.collectionViewCell.rawValue, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.loadCell(model: self)
        return cell
    }
}
