//
//  TableViewCell.swift
//  MvvmExam
//
//  Created by MinKu Kim on 2018. 9. 6..
//  Copyright © 2018년 KimMinKu. All rights reserved.
//

import UIKit

// MARK: - Overrides
class TableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
