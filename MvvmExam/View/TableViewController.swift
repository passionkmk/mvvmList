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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
}

// MARK: - Functions
extension TableViewController {
    
}

// MARK: - UITableView Datasource
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

