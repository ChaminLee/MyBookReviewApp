//
//  DetailViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/29.
//

// 읽은 책 수, 적은 글귀 수, 작가들, 책 이름들, 문의하기, 

import UIKit

class UserInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let myTableView: UITableView = {
        let tb = UITableView()
        tb.register(SearchCell.self, forCellReuseIdentifier: SearchCell.searchIdentifier)
        return tb
    }()
    let fieldView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor().defaultBackgroundColor
        addTopTitle()
        setTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }

    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTableView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
            
        }
    }
    
    func setTableView() {
        self.view.addSubview(myTableView)
        
        myTableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.searchIdentifier)
        myTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.searchIdentifier, for: indexPath) as! SearchCell
        let data = dataManager.shared.searchResult?.items[indexPath.row]
        do {
            let imageURL = URL(string: "\(data?.image)")
            let imageData = try Data(contentsOf: imageURL!)
            let posterImage = UIImage(data: imageData)
            cell.searchTitle.text = data?.title
            cell.searchAuthor.text = data?.author
            cell.searchBookImage.image = posterImage
        } catch {
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200.0)
    }
    

}


extension UserInfoViewController {
    func addTopTitle(){
        let label : UILabel = {
            let lb = UILabel()
            lb.text = "내 정보"
            lb.textColor = UIColor.white
            
            return lb
        }()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: CustomColor().textColor]

        self.navigationController?.navigationBar.topItem?.title = label.text
        self.navigationController?.navigationBar.barTintColor = CustomColor().defaultBackgroundColor
        
    }
}
