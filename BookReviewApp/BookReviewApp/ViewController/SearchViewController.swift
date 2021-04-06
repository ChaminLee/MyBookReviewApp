//
//  SearchViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/30.
//

import UIKit

class SearchViewController: UIViewController {

    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor().defaultBackgroundColor
        addTopTitle()

        let custombt : UIButton = {
            let bt = UIButton(frame: CGRect(x: 10, y: 300, width: 300, height: 300))
            bt.setTitle("READ DATA", for: .normal)
            bt.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
            bt.setTitleColor(.blue, for: .normal)
            
            bt.addTarget(self, action: #selector(readData), for: .touchUpInside)
            return bt
        }()
        
        view.addSubview(custombt)
//        setupScrollView()
//        initializeHideKeyboard()
    }
    
    
    @objc func readData() {
        print("----testing----")
//        FirebaseDB.dbref.observe(.value) { (snapshot) in
//            if let result = snapshot.value as? [Any] {
//                result.forEach { (item) in
//                    let section = Section(dictionary: item as! [String : Any])
//                    print("---test section \(section)")
//                    self.testList.append(section)
//                }
//
//            }
//
//        }
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
    }
    
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])


    }


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
