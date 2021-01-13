//
//  ViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2020/12/10.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let db = Database.database().reference()
    
    var customers: [Customer] = []
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func clickButton(_ sender: Any) {
        saveCustomer()
    }
    @IBAction func updateButton(_ sender: Any) {
        updateInfos()
    }
    @IBAction func delButton(_ sender: Any) {
        deleteInfo()
    }
    
    @IBAction func readButton(_ sender: Any) {
        readData()
    }
}


extension ViewController {
    func saveCustomer() {
        
        let books = Book(title: "lovePoet", thumbnail: "썸네일", author: "이차민", date: "2021.01.13")
        db.child("Customer1").setValue(["\(books.title)":books.toDictionary])
    }
    
    func updateInfos() {
        guard let key = db.child("Customer1").childByAutoId().key else { return }
        let updateBooks = Book(title: "실내인간", thumbnail: "썸네일2", author: "이차민2", date: "2021.01.14").toDictionary
        let childUpdate = ["/Customer1/\(key)":updateBooks]
        db.updateChildValues(childUpdate)
       
    }
    func deleteInfo() {
        guard let key = db.child("Customer1").childByAutoId().key else { return }

        db.child("/Customer1").removeValue()
    }
    
    func readData() {
        db.child("Customer1").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let title = value!["title"] as? String ?? ""
            print(value)
            print(title)
        })  { (error) in print(error.localizedDescription)}
    }
}



struct Customer: Codable {
    let id: String
    var name: String
    let books: [Book]
    
    var toDictionary: [String:Any] {
        let booksArray = books.map {$0.toDictionary}
        let dict: [String:Any] = ["id": id, "name": name, "books": booksArray]
        return dict
    }
}


struct Book: Codable {
    let title: String
    let thumbnail: String
    let author: String
    let date : String
    
    var toDictionary: [String:Any] {
        let dict = ["title": title, "thumbnail": thumbnail, "author": author, "date": date]
        return dict
    }
    
//    enum CodingKeys: String, CodingKey {
//        case title = "Title"
//        case thumbnail = "Thumbnail"
//        case author = "author"
//        case date = "date"
//
//    }
}
