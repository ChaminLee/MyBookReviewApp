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
    let identifier = "showDetail"
    
    let topSection : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()
    let infoSection = UIView()
    let mainSection = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor().defaultBackgroundColor
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 700)
    }
    
    
    let closeButton : UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "xmark"), for: .normal)
        bt.imageView?.contentMode = .scaleAspectFit
        bt.imageEdgeInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
        bt.tintColor = CustomColor().textColor
        bt.addTarget(self, action: #selector(close), for: .touchUpInside)
  
        return bt
    }()
    
    let titleText : UILabel = {
        let lb = UILabel()
//        lb.text = "책 제목"
        lb.font = UIFont(name: "Helvetica-Bold", size: 20)
        lb.textColor = CustomColor().textColor
        
        return lb
    }()
    
    let pvbutton : UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "xmark"), for: .normal)
        bt.imageView?.contentMode = .scaleAspectFit
        bt.addTarget(self, action: #selector(presentview), for: .touchUpInside)
        
        return bt
    }()
    
    @objc func presentview() {
        let nextvc = DummyViewController()
        self.present(nextvc, animated: true, completion: nil)
    }
    
    let closeButton2 : UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "xmark"), for: .normal)
        bt.imageView?.contentMode = .scaleAspectFit
        bt.imageEdgeInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
        bt.tintColor = CustomColor().textColor
        bt.addTarget(self, action: #selector(close), for: .touchUpInside)
  
        return bt
    }()
    
    func setup() {
        
        view.addSubview(topSection)
        self.view.addSubview(infoSection)
        self.view.addSubview(mainSection)
        
        topSection.backgroundColor = .red
        infoSection.backgroundColor = .yellow
        mainSection.backgroundColor = .blue
        
        topSection.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(300)
            $0.left.equalToSuperview()
        }
        
        infoSection.snp.makeConstraints {
            $0.top.equalTo(topSection.snp.bottom)
            $0.height.equalTo(200)
            $0.left.equalToSuperview()
        }

//        mainSection.snp.makeConstraints {
//            $0.top.equalTo(infoSection.snp.bottom)
//            $0.bottom.equalToSuperview()
//        }
        
        
        if let name = self.name {
            titleText.text = name
        }
        
        self.view.addSubview(closeButton)
        self.view.addSubview(pvbutton)
        self.topSection.addSubview(closeButton2)
        self.infoSection.addSubview(closeButton2)
//        self.mainSection.addSubview(closeButton2)
        self.topSection.addSubview(titleText)
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.left.equalToSuperview().offset(20)
        }
        
        pvbutton.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
        }
        
        closeButton2.snp.makeConstraints {
            $0.right.equalToSuperview()
        }
        
        titleText.snp.makeConstraints {
            $0.top.equalTo(closeButton)
            $0.left.equalTo(closeButton).offset(40)
        }
        
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }

}
