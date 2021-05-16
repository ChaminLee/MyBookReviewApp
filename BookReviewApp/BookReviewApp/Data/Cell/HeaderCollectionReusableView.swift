//
//  HeaderCollectionReusableView.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/28.
//

import UIKit
import SnapKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "HeaderCollectionReusableView"

    
    let descriptionLabel : UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.text = "그녀는 복수를 했는데 그는 구원을 얻었네 안느, 이것은 당신을 위한 노래입니다. 발기하는 인간과 발화하는 인간 우울하므로, 우울함으로 세상의 종말보다 더 끔찍한 것 그녀는 복수를 했는데 그는 구원을 얻었네 안느, 이것은 당신을 위한 노래입니다. 발기하는 인간과 발화하는 인간 우울하므로, 우울함으로 세상의 종말보다 더 끔찍한 것 그녀는 복수를 했는데 그는 구원을 얻었네 안느, 이것은 당신을 위한 노래입니다. 발기하는 인간과 발화하는 인간 우울하므로, 우울함으로 세상의 종말보다 더 끔찍한 것 "
        lb.textColor = .white

        lb.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        
        return lb
    }()
    
    let titleLabel : UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.text = "- " + "정확한 사랑의 실험" + " 中"
        lb.textColor = .white

        lb.font = UIFont(name: "NotoSansKR-Thin", size: 12)
        
        return lb
    }()
    
    let cardView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        
        view.contentMode = .scaleAspectFill // aspect유지하면서 화면에 꽉차게
        view.layer.cornerRadius = 8.0
        view.layer.masksToBounds = true
        return view
    }()
    
    let testbutton : UIButton = {
        let bt = UIButton()
        bt.titleLabel?.text = "프린트 버튼"
        bt.titleLabel?.textColor = .white
        bt.addTarget(self, action: #selector(testprint), for: .touchUpInside)
        return bt
    }()

    @objc func testprint() {
        print("이것 봐라! \(ViewController().sections)")
    }
    
    public func configure() {
        addSubview(cardView)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(titleLabel)
        cardView.addSubview(testbutton)
        
        cardView.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(10)
            $0.bottom.right.equalToSuperview().offset(-10)
        }
                
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.left.equalToSuperview().offset(13)
            $0.right.equalToSuperview().offset(-13)
            $0.bottom.equalToSuperview().offset(-40)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            $0.right.equalToSuperview().offset(-13)
        }
        
        testbutton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top)
            $0.right.equalTo(titleLabel.snp.left).offset(-20)
        }
    }
}
    
    

