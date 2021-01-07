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
        saveInfo()
    }
    @IBAction func updateInfo(_ sender: Any) {
        updateInfos()
    }
    @IBAction func deleteButton(_ sender: Any) {
        deleteInfo()
    }
}


extension ViewController {
    func saveInfo() {
        db.child("test").setValue(3)
        db.child("test2").setValue(33)
    }
    
    func updateInfos() {
        db.updateChildValues(["test":300])
        db.updateChildValues(["test2":3300])
    }
    func deleteInfo() {
        db.child("test").removeValue()
        db.child("test2").removeValue()
    }
}

//extension ViewController {
//    func fetchInfo() {
//        db.child("customer").observeSingleEvent(of: .value) { snapshot in print("\(snapshot.value)"}
//        do {
//            let data = try JSONSerialization.data
//        }
//    }
//}


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
