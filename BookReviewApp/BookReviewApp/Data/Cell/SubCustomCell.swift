//
//  SubCustomCell.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/28.
//

import UIKit
import SnapKit

class SubCustomCell: UICollectionViewCell {
    
    //    let tagListview : TagListView = TagListView()
//    var parentViewController: UIViewController? = nil
    
    var booklist: BookList? {
        
        didSet {
            // 수정 필요
            print("TEST booklist", self.booklist)
            print("여기여기여기여기 \(ViewController().sections)")
            guard let booklist = self.booklist else { return }
            self.ImageView.image = UIImage(named: booklist.image)
            self.TitleLabel.text = self.booklist?.title
            self.AuthorLabel.text = self.booklist?.author
            self.DateLabel.text = self.booklist?.date
        }        
    }

    // containerView > ImageView
    let containerView: UIView = {
        let uiv = UIView()
        uiv.layer.shadowColor = UIColor.black.cgColor
//        uiv.layer.shadowPath = UIBezierPath(roundedRect: <#T##CGRect#>, cornerRadius: <#T##CGFloat#>)
        uiv.layer.shadowOffset = CGSize(width: 4, height: 4)
        uiv.layer.shadowOpacity = 0.3
        uiv.layer.shadowRadius = 8
//        uiv.layer.shadowPath = CG
        
        return uiv
    }()
    
    let ImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = CustomColor().defaultBackgroundColor
//        iv.image = UIImage(named: "0000.png")
        
        iv.contentMode = .scaleAspectFill // aspect유지하면서 화면에 꽉차게
        iv.layer.cornerRadius = 8.0
        iv.layer.masksToBounds = true
        
        return iv
    }()

    let TitleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = CustomColor().textColor
        lb.font = CustomFont().title_main
        return lb
    }()

    let AuthorLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = CustomColor().textColor
        lb.font = CustomFont().subtitle_main
        return lb
    }()
    
    let DateLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = .gray
        lb.font = CustomFont().subtitle_main
        return lb
    }()
    
//    let button : UIButton = {
//        let bt = UIButton()
//        bt.alpha = 0
//        bt.addTarget(self, action: #selector(gotoNewVC), for: .touchUpInside)
//
//        return bt
//    }()
 

//    @objc func gotoNewVC() {
//        let newVC = DetailViewController()
//        parentViewController?.present(newVC, animated: true, completion: nil)
//    }
    
    override init(frame: CGRect) {
    super.init(frame: frame)
        containerView.addSubview(ImageView)
        addSubview(containerView)
        addSubview(TitleLabel)
        addSubview(AuthorLabel)
        addSubview(DateLabel)
//        addSubview(button)
        
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        TitleLabel.translatesAutoresizingMaskIntoConstraints = false
        AuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        DateLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        button.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.bottom.equalToSuperview()
//            $0.left.equalToSuperview()
//            $0.right.equalToSuperview()
//        }
        
        NSLayoutConstraint.activate([
            ImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            ImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            ImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            ImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 25), // image vs subcell
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            containerView.heightAnchor.constraint(equalToConstant: 180),
            
            TitleLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor,constant: 20),
            TitleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            TitleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),

            AuthorLabel.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 5),
            AuthorLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            AuthorLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            
            DateLabel.topAnchor.constraint(equalTo: AuthorLabel.bottomAnchor, constant: 5),
            DateLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            DateLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor)
        ])
        
        


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
