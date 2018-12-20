//
//  TableViewController.swift
//  MvvmExam
//
//  Created by KimMinKu on 2018. 9. 1..
//  Copyright © 2018년 KimMinKu. All rights reserved.
//

import UIKit

// MARK: - Overrides
class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModels: [TableViewCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(nibClass: TableViewCell.self)
        self.tableView.rowHeight = 44.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TableViewController.searchRequestDone(notification:)),
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
extension TableViewController {
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
extension TableViewController {
    func loadData(_ datas: [AppData]) {
        self.viewModels = datas.map { TableViewCellModel(with: $0) }
        self.tableView.reloadData()
    }
}

// MARK: - UITableView Datasource
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.viewModels[indexPath.row].loadCell(with: tableView, indexPath: indexPath)
    }
}

