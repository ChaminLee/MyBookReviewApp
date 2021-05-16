//
//  CustomCell.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/28.
//
// name : 책꼬치

import UIKit


class CustomCell : UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource,
                   UICollectionViewDelegateFlowLayout {

    
    var section: Section? {
        didSet {

            guard let section = self.section else { return }
            
            self.sectionTitleLabel.text = section.title
            self.section?.bookList.forEach({ (item) in
                let booklist = BookList(dictionary: item as! [String : Any])
                if !self.booklists.contains(booklist) {
                    self.booklists.append(booklist)
                }

            })
            
        }
    }

    
    
    lazy var booklists = [BookList]()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.backgroundColor = CustomColor().defaultBackgroundColor
        // scroll bar 없애기
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let identifier: String = "cellID"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.booklists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SubCustomCell

        
        cell.booklist = booklists[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // SubCustomCell size
        let width = frame.width / 3 
        let height = frame.height 
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print("해당 아이템은 \(indexPath.item)번째")
        print("제목은 \(booklists[indexPath.item].title)")
        // Segue 자리
        let nextVC = DetailViewController()
        nextVC.name = booklists[indexPath.item].title
        
        nextVC.modalPresentationStyle = .fullScreen
        self.window?.rootViewController?.present(nextVC, animated: true, completion: nil)
        
    }
    
    
    
    // button action 관련
    
    
    
    let sectionTitleLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = CustomColor().textColor
        lb.font = CustomFont().title_section
        
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(sectionTitleLabel)
        
        sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sectionTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        sectionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        sectionTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        setUpSubCell()
        collectionView.register(SubCustomCell.self, forCellWithReuseIdentifier: identifier)
    }
    
    fileprivate func setUpSubCell() {
        addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder aDecdoer: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
