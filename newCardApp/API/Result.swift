//
//  Result.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

enum Result<T> {
    case success(T)
    case failure(APIError)

    public func dematerialize() throws -> T {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
}

//struct AF {
//  static func printLog(_ request: APIRouter, _ response: DataResponse<Any>) {
//    print("---------------------------------------------------------")
//    print(request.method.rawValue.uppercased())
//    print(request.urlPath())
//    print(request.addAuthHeader(&<#URLRequest#>))
//    print(response)
//    
//    print("---------------------------------------------------------")
//  }
//}
