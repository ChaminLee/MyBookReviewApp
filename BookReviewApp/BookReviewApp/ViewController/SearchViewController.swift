//
//  SearchViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/30.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var searchRes = [SearchResult.BookInfo]()
    
    private let myTableView: UITableView = {
        let tb = UITableView()
        tb.register(SearchCell.self, forCellReuseIdentifier: SearchCell.searchIdentifier)
        return tb
    }()
    
    
    let identifier: String = "cellID"
    let jsonDecoder: JSONDecoder = JSONDecoder()
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor().defaultBackgroundColor
        addTopTitle()
//        config()
        setSearchBar()
        setTableView()
        initializeHideKeyboard()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    func setTableView() {
        self.view.addSubview(myTableView)
        
//        self.myTableView.separatorColor = .clear
        self.myTableView.tableFooterView = UIView()
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchRes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.searchIdentifier, for: indexPath) as! SearchCell
        let item = self.searchRes[indexPath.row]
        do {
            let imageURL = URL(string: "\(item.image)")
            let imageData = try Data(contentsOf: imageURL!)
            let realImg = UIImage(data: imageData)
            cell.searchBookImage.image = realImg
        } catch {

        }
        
        cell.searchTitle.text = item.title.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
        cell.searchAuthor.text = item.author.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")

//        tableView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked: \(indexPath.row)")
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200.0)
    }
    
    
    
    let errorMessage : UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: "Helvetica-Bold", size: 20)
        lb.textColor = CustomColor().textColor
        
        return lb
    }()
    
}

extension SearchViewController {
    func addTopTitle() {
        let label : UILabel = {
            let lb = UILabel()
            lb.text = "검색"
            lb.textColor = UIColor.white
            
            return lb
        }()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: CustomColor().textColor]
        
        self.navigationController?.navigationBar.topItem?.title = label.text
//        self.navigationController?.navigationBar.barTintColor = CustomColor().headerColor
        navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.setStatusBar(backgroundColor: .white)

        
    }
    
    func setSearchBar() {
        searchBar.sizeToFit()
        searchBar.delegate = self
        showSearchBarButton(shouldShow: true)
        searchBar.placeholder = "책 제목을 입력해주세요."
        searchBar.tintColor = .black
    }
    
    @objc func handleShowSearchBar() {
        print("Show Search bar")
        search(shouldShow: true)
        // 클릭시 돋보기 지우기
        navigationItem.rightBarButtonItem = nil
        // 바로 키보드 띄우기
        searchBar.becomeFirstResponder()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("editing..")
        DispatchQueue.main.async {
//            self.searchBookImage.image = nil
//            self.searchTitle.text = nil
//            self.searchAuthor.text = nil

        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("end")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("print : \(searchText)")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let query: String = searchBar.text!
        print(query)
        requestToNaver(customQuery: query)
        searchBar.resignFirstResponder()
    }
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
}

extension SearchViewController {
    func urlTaskDone() {
        // 데이터가 있을 때
        guard let items = dataManager.shared.searchResult?.items else { return }
        DispatchQueue.main.async {
//            self.myTableView.separatorColor = .black
            self.searchRes.removeAll()
            self.searchRes.append(contentsOf: items)
            self.myTableView.reloadData()
            SearchCell().searchTitle.text = items[0].title
            print("디스패치이잉")
        }

         
    }
    
    func requestToNaver(customQuery: String) {
        print("Starting-----")
        let clientID: String = "KDWnDVsw4IA3CV7MP5xX"
        let clientPW: String = "_vyuCxyyDF"
        
        let query: String = "https://openapi.naver.com/v1/search/book.json?query=\(customQuery)"
        let encodedQuery: String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        print(encodedQuery)
        let queryURL: URL = URL(string: encodedQuery)!
        
        
        var requestURL = URLRequest(url: queryURL)
        requestURL.httpMethod = "GET"
        
        requestURL.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requestURL.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        requestURL.addValue(clientPW, forHTTPHeaderField: "X-Naver-Client-Secret")

        
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard error == nil else { print(error!); return }
            guard let data = data else { print("데이터를 못바"); return }
            print("data :\(data)")
 
            do {
                let searchInfo: SearchResult = try self.jsonDecoder.decode(SearchResult.self, from: data)
                dataManager.shared.searchResult = searchInfo
                self.urlTaskDone()
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
}


extension SearchViewController: UITextFieldDelegate {
    
    func initializeHideKeyboard(){
        //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        //Add this tap gesture recognizer to the parent view
        view.addGestureRecognizer(tap)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    @objc func dismissMyKeyboard(){
        //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
        //In short- Dismiss the active keyboard.
        view.endEditing(true)
    }
}
