//
//  CustomCell.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/28.
//

import UIKit

class CustomCell : UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource,
                   UICollectionViewDelegateFlowLayout{
    
    var section: Section? {
        didSet {
            
            guard let section = self.section else { return }
            self.sectionTitleLabel.text = section.title
            self.section?.bookList.forEach({ (item) in
                 let booklist = BookList(dictionary: item as! [String : Any])
                 self.booklist.append(booklist)
            })
            
            self.collectionView.reloadData()
        }
    }
    
    lazy var booklist = [BookList]()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let identifier: String = "cellID"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.booklist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SubCustomCell
        
        cell.backgroundColor = .yellow
        cell.booklist = booklist[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = frame.width / 2
        let height = frame.height / 2
        
        return CGSize(width: width, height: height)
    }
    
    let sectionTitleLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = .systemPink
        lb.textAlignment = .left
        lb.text = "Section Title"
        lb.font = UIFont(name: "Helvetica-Bold", size: 30)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(sectionTitleLabel)
        
        sectionTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        sectionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        setUpSubCell()
        collectionView.register(SubCustomCell.self, forCellWithReuseIdentifier: identifier)
    }
    
    fileprivate func setUpSubCell() {
        addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor,constant: 15).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder aDecdoer: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
