//
//  DetailViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/29.
//

// 읽은 책 수, 적은 글귀 수, 작가들, 책 이름들, 문의하기, 

import UIKit

class UserInfoViewController: UIViewController {

    
    let fieldView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor().defaultBackgroundColor
        addTopTitle()
    }
    
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }


}


extension UserInfoViewController {
    func addTopTitle(){
        let label : UILabel = {
            let lb = UILabel()
            lb.text = "내 정보"
            lb.textColor = UIColor.white
            
            return lb
        }()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: CustomColor().textColor]

        self.navigationController?.navigationBar.topItem?.title = label.text
        self.navigationController?.navigationBar.barTintColor = CustomColor().defaultBackgroundColor
        
    }
}
