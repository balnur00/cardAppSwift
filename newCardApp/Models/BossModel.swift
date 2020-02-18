//
//  BossModel.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import ObjectMapper
import KeychainSwift

enum AuthorizationType {
  case unauthorized
  case authorized
}

class BossModel {

    var authorizationType: AuthorizationType {
      return token != nil ? .authorized : .unauthorized
    }
    
    var bossId:Int!
    var firstname:String!
    var lastname:String!
    var username:String!
    var password:String!
    var email:String!
    var token: String!{
      set {
        let keyChain = KeychainSwift()
        keyChain.set(newValue, forKey: "token")
      }
      get {
        let keyChain = KeychainSwift()
        return keyChain.get("token") ?? ""
      }
    }
    
    fileprivate static var boss: BossModel?
    public static var currentBoss: BossModel {
      get {
        if boss == nil {
            boss = BossModel()
        }
        return boss!
      }
      set (newValue) {
        boss = newValue
      }
    }
    required public convenience init?(map: Map) {
      self.init()
    }
    
    convenience init(_ response: LoginResponse) {
        self.init()
        self.username = response.profile.username
        self.email = response.profile.email
//        self.password = response.profile.password
        self.token = response.token
    }
    
//    init?(map:Map) {
//    }
    
    public func doLogout() {
    }
        
    func mapping(map:Map){
        bossId <- map["bossId"]
        firstname <- map["firstname"]
        lastname <- map["lastname"]
        username <- map["username"]
        password <- map["password"]
        email <- map["email"]
        token <- map["token"]
    }
    
}


//class User {
//    var name: String?
//    var email: String?
//    var password: String?
//    
//    static let current = User()
//
//    var token: String? {
//        set {
//            let keyChain = KeychainSwift()
//            keyChain.set(newValue ?? "", forKey: "token")
//        }
//        get {
//          let keyChain = KeychainSwift()
//          return keyChain.get("token")
//        }
//    }
//}
