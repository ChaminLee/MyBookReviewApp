//
//  BookList.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/28.
//

import Foundation

struct BookList {
    var title: String
    var author: String
    var image: String
    
    init(dictionary : [String:Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        self.image = dictionary["image"] as? String ?? ""
    }
}
