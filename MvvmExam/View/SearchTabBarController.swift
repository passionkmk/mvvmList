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
    
    override func loadView() {
        super.loadView()
        // TODO : - Init Nib
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.becomeFirstResponder()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
            // TODO: - goSearch
        }
        else {
            textField.text = nil
        }
        textField.resignFirstResponder()
        return true
    }
}
