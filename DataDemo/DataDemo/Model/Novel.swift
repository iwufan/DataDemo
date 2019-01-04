//
//  Novel.swift
//  DataDemo
//
//  Created by 贾大伟 on 2019/1/4.
//  Copyright © 2019 david. All rights reserved.
//

import Foundation
import ObjectMapper

struct Novel: Mappable {
    
    var bookID: String!
    var name: String!
    var authorName: String!
    var brief: String!
    var coverURL: String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        bookID      <- map["bid"]
        name        <- map["bookname"]
        authorName  <- map["author_name"]
        brief       <- map["introduction"]
        coverURL    <- map["book_cover"]
    }
}
