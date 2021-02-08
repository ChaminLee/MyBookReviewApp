//
//  DetailViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/30.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let closeButtton : UIButton = {
            let bt = UIButton(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
            bt.backgroundColor = .red
            bt.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
            return bt
        }()
        
        self.view.addSubview(closeButtton)
    }
    @objc func buttonClicked() {
        dismiss(animated: true, completion: nil)
    }

}
