//
//  RoleModel.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import ObjectMapper

struct RoleModel:Mappable {
    var name:String?
    
    init?(map:Map) {}
    
    mutating func mapping(map: Map){
        name <- map["name"]
    }
}
