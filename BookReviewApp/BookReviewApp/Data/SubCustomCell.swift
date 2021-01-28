//
//  SubCustomCell.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/28.
//

import Foundation
import UIKit

class SubCustomCell: UICollectionViewCell {

    var booklist: BookList? {
        didSet {
            print("booklist",self.booklist)
            guard let booklist = self.booklist else { return }
            self.ImageView.image = UIImage(named: booklist.image)
            self.TitleLabel.text = self.booklist?.title
            self.AuthorLabel.text = self.booklist?.author
        }
    }

    let ImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGreen
        iv.image = UIImage(named: "0000.png")
        iv.contentMode = .scaleAspectFill // aspect유지하면서 화면에 꽉차게
        iv.clipsToBounds = true
        return iv
    }()

    let TitleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.lightGray
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.text = "This is Book Title"
        return lb
    }()

    let AuthorLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.lightGray
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.text = "Lee Cha Min"
        return lb
    }()

    override init(frame: CGRect) {
    super.init(frame: frame)
        addSubview(ImageView)
        addSubview(TitleLabel)
        addSubview(AuthorLabel)


        ImageView.translatesAutoresizingMaskIntoConstraints = false
        ImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        ImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        ImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        ImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        ImageView.bottomAnchor.constraint(equalTo: TitleLabel.topAnchor,constant: -15).isActive = true



        TitleLabel.translatesAutoresizingMaskIntoConstraints = false
        TitleLabel.topAnchor.constraint(equalTo: ImageView.bottomAnchor,constant: 20).isActive = true
        TitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        TitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true

        AuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        AuthorLabel.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 20).isActive = true
        AuthorLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        AuthorLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true



    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
