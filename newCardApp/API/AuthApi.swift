//
//  AuthApi.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/11/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

//typealias loginResponse = (Result<Bool>) -> Void
typealias loginResponse = (Result<LoginResponse>) -> Void

struct AuthAPI {
        
//    let user = BossModel(response)
//    BossModel.currentBoss = user
//    let keychain = KeychainSwift()
//    keychain.set(response.username, forKey: "username")
//    keychain.set(response.token, forKey: "token")
          
    public static func userLogin(_ login: String, _ password: String, _ completion: @escaping loginResponse)
    {
        let request = APIRouter.login(login, password)
        Alamofire
            .request(request)
            .responseJSON(completionHandler: { (response: DataResponse<Any>) in
                print(response.response?.statusCode)
                switch response.result {
                case .success(let result):
                    print(result)
                    if let dict = result as? [String: Any] ,
                        let token = dict["token"] as? String {
                            BossModel.currentBoss.token = token
                        
//                        completion(.success())
                    } else {
                        completion(.failure(.badRequest("JSON handle token")))
                    }
                case .failure(let error):
                    completion(.failure(.badRequest(error.localizedDescription)))
                }
            })
            .responseObject { (response: DataResponse<LoginResponse>) in
            
            if let response = response.result.value {
                completion(Result.success(response))
            }
        }
    }
}
