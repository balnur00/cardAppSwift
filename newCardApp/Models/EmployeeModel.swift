//
//  EmployeeModel.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct Employee: Mappable {

    var employeeId:Int!
    var firstname:String!
    var lastname:String!
    var skinname:String!
    var boss:String!
    var role:String!
    var skills:[SkillModel]!
    
    init() {}
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        employeeId <- map["id"]
        firstname <- map["name"]
        lastname <- map["surname"]
        skinname <- map["skinname"]
        
        role <- map["role"]
        boss <- map["boss"]
        skills <- map["skills"]
    }

}
