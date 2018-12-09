//
//  Nib.swift
//  MvvmExam
//
//  Created by 김민구 on 09/12/2018.
//  Copyright © 2018 KimMinKu. All rights reserved.
//

import UIKit

// MARK: - Initialize
public enum Nib: String {
    case tableViewCell = "TableViewCell"
    case collectionViewCell = "CollectionViewCell"
}

// MARK: - Function
extension UITableView {
    public func register(nib: Nib) {
        self.register(UINib(nibName: nib.rawValue, bundle: nil), forCellReuseIdentifier: nib.rawValue)
    }
}

