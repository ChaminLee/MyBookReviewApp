//
//  DetailViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/29.
//

import UIKit

class UserInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addTopTitle()
//        self.navigationController?.navigationBar.topItem?.title = "내 정보"
        
        view.backgroundColor = .systemGray2
        
        let label : UILabel = {
            let lb = UILabel(frame: CGRect(x: 50, y: 50, width: self.view.frame.width, height: 50))
            lb.textColor = .black
            lb.font = UIFont(name: "Helvetica-Bold", size: 30)
            lb.text = "EEEEEE"
            return lb
        }()
        
        self.view.addSubview(label)
        
    }
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }
     

}


extension UserInfoViewController {
    func addTopTitle() {
        let label = UILabel()
        label.text = "내 정보"
        label.textColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = label.text
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationController?.navigationItem.titleView = UIImageView(image: UIImage())
    }
}
