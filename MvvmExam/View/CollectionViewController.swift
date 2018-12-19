//
//  CollectionViewController.swift
//  MvvmExam
//
//  Created by KimMinKu on 2018. 9. 1..
//  Copyright © 2018년 KimMinKu. All rights reserved.
//

import UIKit

// MARK: - Overrides
class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModels: [CollectionViewCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(nib: .collectionViewCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(CollectionViewController.searchRequestDone(notification:)),
                                               name: Notification.Name(Networking.notificationName.search.rawValue),
                                               object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Notification
extension CollectionViewController {
    @objc func searchRequestDone(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else {
            return
        }
        
        if let datas = userInfo["data"] as? [AppData] {
            self.loadData(datas)
        }
    }
}



// MARK: - Functions
extension CollectionViewController {
    func loadData(_ datas: [AppData]) {
        self.viewModels = datas.map { CollectionViewCellModel(with: $0) }
        self.collectionView.reloadData()
    }
}

// MARK: - UICollectionView Datasource
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.viewModels[indexPath.item].loadCell(with: collectionView, indexPath:indexPath)
    }
}

// MARK: - UICollectionView Delegates
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = self.view.frame.size.width / 2.0
        return CGSize(width: side, height: side)
    }
}

