//
//  SearchTabBarController.swift
//  MvvmExam
//
//  Created by MinKu Kim on 2018. 10. 31..
//  Copyright © 2018년 KimMinKu. All rights reserved.
//

import UIKit

protocol SearchDelegate {
    func searchComplete(datas: [AppData])
}

// MARK: - Overrides
class SearchTabBarController: UITabBarController {
    @IBOutlet weak var textField: UITextField!
    
    var searchDelegate: SearchDelegate?
    
    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.textField.becomeFirstResponder()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

// MARK: - Functions
extension SearchTabBarController {
    func search(keyword: String) {
        Request.search(with: keyword, success: { (json) in
            let datas = json.arrayValue.map { AppData(data: $0) }
            self.searchDelegate?.searchComplete(datas: datas)
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
