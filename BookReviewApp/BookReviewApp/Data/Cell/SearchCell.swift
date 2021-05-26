//
//  SearchCell.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/04/23.
//

import UIKit
import SnapKit

class SearchCell: UITableViewCell {
    

    static let searchIdentifier: String = "cellID"
    
    let searchBookImage : UIImageView = {
        let img = UIImageView()
        // 검색 결과 없을 때 디폴트 이미지
        img.image = UIImage(named: "0006")
        
        img.contentMode = .scaleAspectFill // aspect유지하면서 화면에 꽉차게
        img.layer.cornerRadius = 8.0
        img.layer.masksToBounds = true
        return img
    }()
    
    let searchTitle : UILabel = {
        let lb = UILabel()
        lb.text = "책 제목"
        lb.font = CustomFont().title_header
        lb.textColor = CustomColor().textColor
        lb.numberOfLines = 3
        return lb
    }()
    
    let searchAuthor : UILabel = {
        let lb = UILabel()
        lb.text = "저자"
        lb.font = CustomFont().title_body
        lb.textColor = CustomColor().textColor
        lb.numberOfLines = 0
        
        return lb
    }()
    
    let searchPublisher : UILabel = {
        let lb = UILabel()
        lb.text = "저자"
        lb.font = CustomFont().title_body
        lb.textColor = CustomColor().textColor
        lb.numberOfLines = 0
        
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = CustomColor().defaultBackgroundColor
        addSubview(searchBookImage)
        addSubview(searchTitle)
        addSubview(searchAuthor)
        addSubview(searchPublisher)
        
//        searchBookImage.frame = CGRect(x: contentView.frame.size.width - 50, y: 3, width: 50, height: 50)
        
        searchBookImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-10)
            $0.left.equalToSuperview().offset(20)
            
            $0.width.equalTo(80)
//            $0.height.equalTo(160)
        }
        
        searchTitle.snp.makeConstraints {
            $0.top.equalTo(searchBookImage.snp.top)
            $0.left.equalTo(searchBookImage.snp.right).offset(20)
            $0.right.equalToSuperview().offset(-10)
//            $0.width.equalTo(220)
            $0.height.equalTo(50)
        }
        
        searchAuthor.snp.makeConstraints {
            $0.bottom.equalTo(searchPublisher.snp.top).offset(-10)
            $0.left.equalTo(searchTitle)
            $0.right.equalToSuperview().offset(-10)
//            $0.width.equalTo(searchTitle)
//            $0.height.equalTo(20)
        }
        
        searchPublisher.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.left.equalTo(searchTitle)
            $0.right.equalToSuperview().offset(-30)
//            $0.width.equalTo(searchTitle)
//            $0.height.equalTo(20)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
