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
    var bookimg : UIImage?
    let identifier = "showDetail"
    
    let mainSection : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()
    let infoSection = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor().defaultBackgroundColor
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
        bt.setImage(UIImage(systemName: "pencil.circle"), for: .normal)
        bt.imageView?.contentMode = .scaleAspectFit
        bt.imageEdgeInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
        bt.tintColor = CustomColor().textColor
        bt.addTarget(self, action: #selector(presentview), for: .touchUpInside)
        
        return bt
    }()
    
    @objc func presentview() {
        let nextvc = DummyViewController()
        self.present(nextvc, animated: true, completion: nil)
    }
    
    func setup() {
        self.view.addSubview(infoSection)
        self.view.addSubview(mainSection)
        
        infoSection.backgroundColor = .red
        mainSection.backgroundColor = .yellow
        
        if let name = self.name {
            titleText.text = name
        }
        
        self.view.addSubview(closeButton)
        self.view.addSubview(pvbutton)
        self.view.addSubview(titleText)
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.left.equalToSuperview().offset(20)
        }
        
        titleText.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.top)
            $0.left.equalTo(closeButton.snp.right).offset(20)
        }

        pvbutton.snp.makeConstraints {
            $0.top.equalTo(titleText.snp.top)
            $0.right.equalToSuperview().offset(-20)
        }

        mainSection.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(20)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(200)
        }
        
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }

}
