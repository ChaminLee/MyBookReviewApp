//
//  HeartViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/02/08.
//

import UIKit

class HeartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor().defaultBackgroundColor
        addTopTitle()
        self.navigationItem.title = "최애"
    }
 
    
    
    
}


extension HeartViewController {
    func addTopTitle() {
        let label : UILabel = {
            let lb = UILabel()
            lb.text = "하트"
            lb.textColor = UIColor.white
            
            return lb
        }()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: CustomColor().textColor]
        
        self.navigationController?.navigationBar.topItem?.title = label.text
        self.navigationController?.navigationBar.barTintColor = .white
        
    }
}
