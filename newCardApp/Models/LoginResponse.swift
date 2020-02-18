//
//  LoginResponse.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/13/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import ObjectMapper

struct LoginResponse {

  var profile: Profile!
  var token: String!
}

extension LoginResponse: Mappable {
  init?(map: Map) {}
  mutating func mapping(map: Map) {
    profile   <- map["user"]
    token      <- map["token"]
  }
}

struct Profile {

    var username: String!
    var email: String!
    var id: Int!
}

extension Profile: Mappable {
  init?(map: Map) {}
  mutating func mapping(map: Map) {
    username   <- map["username"]
    email      <- map["email"]
    id      <- map["id"]
  }
}
