//
//  Section.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/01/28.
//

import Foundation

struct Section {
    var title : String
    // 형이 명확하게 정해지지 않은 불특정 형 집합 데이터나 여러 종류의 값이 섞여 있는 집합 데이터를 처리하고자 할 때는
    // NSArray나 NSMutableArray를 사용해야 한다.
    var bookList : NSArray
    
    init(dictionary:[String : Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.bookList = dictionary["bookList"] as? NSArray ?? []
    }

}
