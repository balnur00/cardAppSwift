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
    var username:String!
    var boss:String!
    var role:String!
    var softSkill:[SoftSkillModel]!
    var hardSkill:[HardSkillModel]!
    
    init() {}
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        employeeId <- map["id"]
        firstname <- map["name"]
        lastname <- map["surname"]
        username <- map["skinname"]
        
        role <- map["role"]
        boss <- map["boss"]
        softSkill <- map["softSkill"]
        hardSkill <- map["hardSkill"]
    }

}
