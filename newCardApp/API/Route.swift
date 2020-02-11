//
//  Route.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case employeeList
    case employeeDetail(String)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .employeeList:
            return .get
        case .employeeDetail:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .employeeList:
            return "/employeeList"
        case .employeeDetail(let id):
            return "/employee/\(id)"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .employeeList:
            return nil
        case .employeeDetail:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var baseURL: String {
            switch App.mode {
            case .test:
                return App.testURL
            case .prod:
                return App.baseURL
            }
        }
        let url = try URL(string: baseURL)!
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
 
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

public enum APIError: Error {
    case badRequest(String)
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest(let message):
            return NSLocalizedString(message, comment: "")
        }
    }
}

