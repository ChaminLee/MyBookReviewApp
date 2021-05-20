//
//  DetailViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/30.
//

import UIKit
import SnapKit
 
class DetailViewController: UIViewController {
 
    var name : String?
    var author : String?
    var bookimg : UIImage?
    let identifier = "showDetail"
    
    let mainSection = UIView()
    let infoSection = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor().defaultBackgroundColor
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    let titleText : UILabel = {
        let lb = UILabel()
//        lb.text = "책 제목"
        lb.font = CustomFont().title_header
        lb.textColor = CustomColor().textColor
        
        return lb
    }()
    
    let authorText : UILabel = {
        let lb = UILabel()
        lb.font = CustomFont().title_header
        lb.textColor = CustomColor().textColor
        
        return lb
    }()
    
    let bookCover : UIImageView = {
        let img = UIImageView()
        
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 8.0
        img.layer.masksToBounds = true
        return img
    }()
    
    let writeButton : UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "pencil.circle"), for: .normal)
        bt.imageView?.contentMode = .scaleAspectFit
        bt.imageEdgeInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
        bt.tintColor = CustomColor().textColor
        bt.addTarget(self, action: #selector(presentview), for: .touchUpInside)
        
        return bt
    }()
    
    @objc func presentview() {
        let nextvc = AddDetailViewController()
        self.present(nextvc, animated: true, completion: nil)
    }
    
    func setup() {
        self.view.addSubview(mainSection)
        self.view.addSubview(infoSection)
        
        infoSection.backgroundColor = CustomColor().defaultBackgroundColor
        mainSection.backgroundColor = .lightGray
        
        if let name = self.name {
            titleText.text = name
        }
        if let img = self.bookimg {
            bookCover.image = img
        }
        if let author = self.author {
            authorText.text = author
        }
        
        
        self.view.addSubview(writeButton)
        self.view.addSubview(titleText)
        self.mainSection.addSubview(bookCover)
        self.mainSection.addSubview(authorText)
  
        
        titleText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalTo(writeButton.snp.left).offset(-20)
        }

        writeButton.snp.makeConstraints {
            $0.top.equalTo(titleText.snp.top)
            $0.right.equalToSuperview().offset(-20)
        }

        mainSection.snp.makeConstraints {
            $0.top.equalTo(titleText.snp.bottom).offset(20)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        bookCover.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-20)
            $0.width.equalTo(100)
        }
        
        authorText.snp.makeConstraints {
            $0.top.equalTo(bookCover.snp.top)
            $0.left.equalTo(bookCover.snp.right).offset(20)
        }
        
        infoSection.snp.makeConstraints {
            $0.top.equalTo(mainSection.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
        
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }

}
