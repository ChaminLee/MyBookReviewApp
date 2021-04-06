//
//  FirebaseDB.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/03/27.
//

import Foundation
import Firebase

struct FirebaseDB {
    
    static let db = Database.database()
    static let dbref = db.reference()
//    db.ispersis
    
    static func getBookInfo() {
        dbref.observe(.value) { (snapshot) in
            if let dict = snapshot.value as? [String : Any] {
                let title = dict["title"] as! String
                let author = dict["author"] as! String
                let date = dict["date"] as! String
                
                
            }
        }
        
        
    }
}

