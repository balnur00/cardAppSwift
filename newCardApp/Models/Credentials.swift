//
//  Credentials.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/12/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct Credential: Mappable {
    var username:String!
    var password:String!
    
    init?(map:Map) {}
    
    mutating func mapping(map: Map){
        username <- map["username"]
        password <- map["password"]
    }
}
