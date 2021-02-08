//
//  HeartViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/02/08.
//

import UIKit

class HeartViewController: UIViewController {

    let headerView : UIView? = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTopTitle()
        self.navigationItem.title = "최애"
//        self.navigationController?.navigationBar.topItem?.title = "최애"

        headerView?.frame(forAlignmentRect: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height/6))
        headerView?.backgroundColor = .white
        
        self.view.addSubview(headerView ?? UIView())
    }
    

}


extension HeartViewController {
    func addTopTitle() {
        let label = UILabel()
        label.text = "하트"
        label.textColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = label.text
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
