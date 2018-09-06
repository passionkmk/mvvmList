//
//  SearchViewController.swift
//  MvvmExam
//
//  Created by MinKu Kim on 2018. 9. 6..
//  Copyright © 2018년 KimMinKu. All rights reserved.
//

import UIKit

// MARK: - Overrides
class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var searchButon: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

// MARK: - Actions
extension SearchViewController {
    @IBAction func search (_ sender: UIButton) {
        
    }
}

// MARK: - Functions
extension SearchViewController {
    
}
