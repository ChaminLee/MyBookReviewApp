//
//  ViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2020/12/10.
//

import UIKit
import Firebase


class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let identifier: String = "cellID"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            
            vc?.modalPresentationStyle = .popover
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    
    // if you made collectionview programmatically, you can use collectionview just call "collectionView"
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        addTopTitle()
        addCollectionView()
        fetchJson()
    }
    
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }
    
    // collectionView init
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var sections = [Section]()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        
        // CustomCell 크기
        let height = CGFloat(300)
        
        return CGSize(width: width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CustomCell
        
        cell.section = sections[indexPath.item]
        cell.collectionView.reloadData()
        
        return cell
    }
    
    
    // body ~ body 사이 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(5)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("sss : \(indexPath.row)")
        // move view
        
    }
    
    
    
    func fetchJson(){
        print("attempt to fetch Json")
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            print(path)
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [ Any] {
                            // do stuff
                    jsonResult.forEach { (item) in
                      
                        let section = Section(dictionary: item as! [String : Any])
                       // print("FEtching",section.playlists)
                        self.sections.append(section)
                    }
                    
                 
                  self.collectionView.reloadData()
                  }
              } catch {
                   // handle error
              }
        }
    }
    
    @objc func didTapButton() {
        print("HHsdfHH")
    }

    
}
    
    
// Header View
extension ViewController {
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        
        header.configure()
        
        if (indexPath.section == 1 ) {
            header.titleLabel.text = "Test if 0"
        } else {
            header.titleLabel.text = "Test if 1"
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    // header ~ body
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 50, bottom: 30, right: 50)
    }
}

// collectionView 추가

extension ViewController {
    func addCollectionView() {
        collectionView.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: identifier)
        
        self.view.addSubview(collectionView)
    }
}

extension ViewController {
    func addTopTitle() {
        let label = UILabel()
        label.text = "책 속의 기억"
        label.textColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = label.text
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}


