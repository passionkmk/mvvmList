//
//  Nib.swift
//  MvvmExam
//
//  Created by 김민구 on 09/12/2018.
//  Copyright © 2018 KimMinKu. All rights reserved.
//

import UIKit

public protocol Nib {
    static var identifier: String { get }
}

// MARK: - Cell Nib Identifier
extension Nib {
    public static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Nib {}
extension UICollectionViewCell: Nib {}

// MARK: - ListView Cell Resster Definition
extension UITableView {
    func register<T: Nib>(nibClass: T.Type) {
        self.register(UINib(nibName: nibClass.identifier, bundle: nil), forCellReuseIdentifier: nibClass.identifier)
    }
    
    func dequeueReuseableCell<T: Nib>(ofType nibClass: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: nibClass.identifier, for: indexPath) as! T
    }
}

extension UICollectionView {
    func register<T: Nib>(nibClass: T.Type) {
        self.register(UINib(nibName: nibClass.identifier, bundle: nil), forCellWithReuseIdentifier: nibClass.identifier)
    }
    
    func dequeueReuseableCell<T: Nib>(ofType nibClass: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: nibClass.identifier, for: indexPath) as! T
    }
}

