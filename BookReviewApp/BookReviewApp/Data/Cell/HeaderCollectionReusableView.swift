//
//  HeaderCollectionReusableView.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/28.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
//    var contentsList: BookList? {
//        didSet {
//            guard let contensList = self.contentsList else { return }
//            self.
//        }
//    }
    
    static let identifier = "HeaderCollectionReusableView"

    
    let descriptionLabel : UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.text = "그녀는 복수를 했는데 그는 구원을 얻었네 안느, 이것은 당신을 위한 노래입니다. 발기하는 인간과 발화하는 인간 우울하므로, 우울함으로 세상의 종말보다 더 끔찍한 것 그녀는 복수를 했는데 그는 구원을 얻었네 안느, 이것은 당신을 위한 노래입니다. 발기하는 인간과 발화하는 인간 우울하므로, 우울함으로 세상의 종말보다 더 끔찍한 것 그녀는 복수를 했는데 그는 구원을 얻었네 안느, 이것은 당신을 위한 노래입니다. 발기하는 인간과 발화하는 인간 우울하므로, 우울함으로 세상의 종말보다 더 끔찍한 것 "
        lb.textColor = .white

        lb.font = UIFont(name: "Helvetica-Bold", size: 15)
        
        return lb
    }()
    
    let titleLabel : UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.text = "- " + "정확한 사랑의 실험" + " 中"
        lb.textColor = .white

        lb.font = UIFont(name: "Helvetica", size: 15)
        
        return lb
    }()

    public func configure() {
//        backgroundColor = .systemGreen
        
        addSubview(descriptionLabel)
        addSubview(titleLabel)

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            // desc
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            // booktitle
            titleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13)
        ])
        
    }
}
    
    

