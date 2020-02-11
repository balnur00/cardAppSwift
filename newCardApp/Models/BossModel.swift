//
//  BossModel.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import ObjectMapper

struct BossModel: Mappable {
    var bossId:Int!
    var firstname:String!
    var lastname:String!
    var username:String!
    var password:String!
    var email:String!
    var token: String!
    
    init?(map:Map) {
    }
    
    mutating func mapping(map:Map){
        bossId <- map["bossId"]
        firstname <- map["firstname"]
        lastname <- map["lastname"]
        username <- map["username"]
        password <- map["password"]
        email <- map["email"]
        token <- map["token"]
    }
    
}
