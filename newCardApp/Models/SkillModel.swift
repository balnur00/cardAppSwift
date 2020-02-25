//
//  SkillModel.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/21/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import ObjectMapper

struct SkillModel:Mappable {
    var id: Int!
    var name: String!
    var level: Int!
    var type: String!
    
    init(id: Int!, name: String!, level: Int!, type: String!) {
        self.id = id
        self.name = name
        self.level = level
        self.type = type
    }
    init?(map:Map) {}
    
    mutating func mapping(map: Map){
        id <- map["id"]
        name <- map["name"]
        level <- map["level"]
        type <- map["type"]
    }
}

