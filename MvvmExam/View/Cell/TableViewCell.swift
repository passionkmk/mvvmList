//
//  TableViewCell.swift
//  MvvmExam
//
//  Created by MinKu Kim on 2018. 9. 6..
//  Copyright © 2018년 KimMinKu. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: - Overrides
class TableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        self.thumbnailImageView.kf.cancelDownloadTask()
    }
}

extension TableViewCell {
    func loadCell(model: TableViewCellModel) {
        let data = model.cellData
        self.titleLabel.text = data.name
        self.subTitleLabel.text = data.develeoperName
        self.thumbnailImageView.kf.setImage(with: URL(string: data.smallThumbnailUrl),
                                            placeholder: nil,
                                            options: [.transition(ImageTransition.fade(0.3))],
                                            progressBlock: nil,
                                            completionHandler: nil)
    }
}
