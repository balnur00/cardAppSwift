//
//  SoftSkillModel.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import ObjectMapper

struct SkillModel:Mappable {
    var id:Int!
    var name:String!
    var level:Int!
    var type:String!
    
    init?(map:Map) {}
    
    mutating func mapping(map: Map){
        id <- map["id"]
        name <- map["name"]
        level <- map["level"]
        type <- map["type"]
    }
}
