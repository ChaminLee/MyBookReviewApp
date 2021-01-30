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

    private let headerLabel : UILabel = {
        let lb = UILabel()
        lb.text = "오늘의 문구"
        lb.textColor = .black
        lb.font = UIFont(name: "Helvetica-Bold", size: 30)
        
        return lb
    }()
    
    private let headerWriteButton : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGray
        iv.image = UIImage(named: "0000.png")
        iv.contentMode = .scaleAspectFill // aspect유지하면서 화면에 꽉차게
        iv.clipsToBounds = true
        
        return iv
    }()
    
    private let SearchButton : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGray
        iv.image = UIImage(named: "0000.png")
        iv.contentMode = .scaleAspectFill // aspect유지하면서 화면에 꽉차게
        iv.clipsToBounds = true
        
        return iv
    }()
    
    private let descriptionLabel : UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.text = "When you add a collection view to your user interface, your app's main job is to ... withReuseIdentifier: String, for: IndexPath) -> UICollectionReusableView."
        lb.textColor = .black

        lb.font = UIFont(name: "Helvetica", size: 15)
        
        return lb
    }()
    
    let headerButton : UIButton = {
        let bt = UIButton()
        bt.setBackgroundImage(UIImage(systemName: "pencil"), for: .normal)
        bt.frame.size = CGSize(width: 50, height: 50)
        bt.tintColor = .black
        
        return bt
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(headerLabel)
        addSubview(headerImage)
        addSubview(headerButton)
        addSubview(descriptionLabel)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true

        headerImage.translatesAutoresizingMaskIntoConstraints = false
        headerImage.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 5).isActive = true
        headerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        headerImage.trailingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: -20).isActive = true
//        headerImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35).isActive = true
        headerImage.heightAnchor.constraint(equalToConstant: 180).isActive = true

        
        headerWriteButton.translatesAutoresizingMaskIntoConstraints = false
        headerWriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        headerWriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width * (2/5)).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configure() {
//        backgroundColor = .white
//        addSubview(headerLabel)
//        addSubview(descriptionLabel)
//
//        headerLabel.translatesAutoresizingMaskIntoConstraints = false
//        headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 45).isActive = true
//
//
//        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 45).isActive = true
//        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width*1/3).isActive = true
//        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
//        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45).isActive = true

    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
