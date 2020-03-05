//
//  Response.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 3/3/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit
import ObjectMapper

struct Response: Mappable {
    var has_more: Bool!
    var total: Int!
    var results: [Employee]!
    var currentPage: Int!
    
    init?(map:Map) {}
    
    init() {}
    
    mutating func mapping(map: Map){
        has_more <- map["has_more"]
        total <- map["total"]
        results <- map["results"]
        currentPage <- map["page"]
    }
}
