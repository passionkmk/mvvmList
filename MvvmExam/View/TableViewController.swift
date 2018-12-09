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
    
    var searchTabbarController: SearchTabBarController?
    var viewModels: [TableViewCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(nib: .tableViewCell)
        self.tableView.rowHeight = 44.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
}

// MARK: - Functions
extension TableViewController {
    func loadData() {
        guard let model = self.searchTabbarController?.dataModel else {
            return
        }
        self.viewModels = model.datas.map { TableViewCellModel(with: $0) }
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

