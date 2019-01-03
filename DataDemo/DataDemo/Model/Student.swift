//
//  Student.swift
//  DataDemo
//
//  Created by 贾大伟 on 2019/1/3.
//  Copyright © 2019 david. All rights reserved.
//

import Foundation
import ObjectMapper

struct Student: Mappable {
    
    var name: String?
    var phone: String?
    var address: String?
    
    init(){
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        name    <- map["name"]
        phone   <- map["phone"]
        address <- map["address"]
    }
}
