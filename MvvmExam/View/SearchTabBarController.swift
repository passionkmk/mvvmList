//
//  SearchTabBarController.swift
//  MvvmExam
//
//  Created by MinKu Kim on 2018. 10. 31..
//  Copyright © 2018년 KimMinKu. All rights reserved.
//

import UIKit

// MARK: - Overrides
class SearchTabBarController: UITabBarController {
    @IBOutlet weak var textField: UITextField!
    
    internal var dataModel = AppDataModel()
    
    // MEMO: - Data Sharing에 대한 연구가 필요 (KVO, Delegate..)
    weak var tableViewController: TableViewController?
    weak var collectionViewController: CollectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewsInit()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.textField.becomeFirstResponder()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

// MARK: - Functions
extension SearchTabBarController {
    func viewsInit() {
        for viewController in self.viewControllers! {
            if let tableViewController = viewController as? TableViewController {
                self.tableViewController = tableViewController
                tableViewController.searchTabbarController = self
            }
            
            if let collectionViewController = viewController as? CollectionViewController {
                self.collectionViewController = collectionViewController
                collectionViewController.searchTabbarController = self
            }
        }
    }
    
    func search(keyword: String) {
        Request.search(with: keyword, success: { (json) in
            let datas = json.arrayValue.map { AppData(data: $0) }
            self.dataModel.datas = datas
            guard let selectedViewController = self.selectedViewController else {
                return
            }
            
            if let tableViewController = self.tableViewController {
                if selectedViewController == tableViewController {
                    tableViewController.loadData()
                }
            }
            
            if let collectionViewController = self.collectionViewController {
                if selectedViewController == collectionViewController {
                    collectionViewController.loadData()
                }
            }
        }) { (error, message) in
            if let message = message {
                print(message)
            }
        }
    }
}

// MARK: - UITextfiled Delegate
extension SearchTabBarController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        
        let trimText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimText.count > 0 {
            self.search(keyword: trimText)
        }
        else {
            textField.text = nil
        }
        textField.resignFirstResponder()
        return true
    }
}

