//
//  SearchData.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/04/21.
//

import Foundation

class dataManager {
    
    static let shared: dataManager = dataManager()
    var searchResult: SearchResult?
    
    private init() {
    
    }
}

struct SearchResult: Codable {
    var lastBuildDate: String
    var total: Int
    var start: Int
    var display: Int
    var items: [BookInfo]
    
    struct BookInfo: Codable {
        var title: String
        var link: String
        var image: String
        var author: String
        var price: String
        var discount: String
        var publisher: String
        var pubdate: String
        var isbn: String
        var description: String
    }
}
