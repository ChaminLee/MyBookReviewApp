//
//  AddBookViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/02/08.
//

import UIKit
import Firebase

class AddBookViewController: UIViewController{

    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTopTitle()
        searchBar.frame(forAlignmentRect: CGRect(x: 40, y: 40, width: self.view.frame.width, height: 40))
        self.view.addSubview(searchBar)
    }
    
    
    

}


extension AddBookViewController {
    func addTopTitle() {
        let label = UILabel()
        label.text = "기록하기"
        label.textColor = UIColor.white
        label.textAlignment = .left
        self.navigationController?.navigationBar.topItem?.title = label.text
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

