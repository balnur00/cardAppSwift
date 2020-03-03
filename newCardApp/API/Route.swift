//
//  Route.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit
import Alamofire

public enum APIRouter: URLRequestConvertible {
    
    case employeeList
    case employeeDetail(String)
    case login(String, String)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .employeeList, .employeeDetail:
            return .get
        case .login:
            return .post
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .employeeList:
            return "/employeeList/"
        case .employeeDetail(let id):
            return "/employee/\(id)/"
        case .login:
            return "/login/"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .employeeList:
            return nil
        case .employeeDetail:
            return nil
        case .login(let username, let password):
            return ["username" : username,
                    "password" : password]
        }
    }
    
    // MARK: - URLRequestConvertible
    public func asURLRequest() throws -> URLRequest {
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
        addAuthHeader(&urlRequest)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        print(urlRequest.url?.absoluteURL ?? "")
        print(urlRequest.httpMethod ?? "--")
        print(urlRequest.urlRequest?.allHTTPHeaderFields ?? "-")
        if let body = urlRequest.urlRequest?.httpBody {
            print(String(data: body, encoding: .utf8))
        }
        return urlRequest
    }
    
    public func addAuthHeader(_ request: inout URLRequest) {
        switch self {
        case .login:
            break
        default:
            if let token = UserModel.currentUser.token {
                request.setValue("JWT \(token)", forHTTPHeaderField: "Authorization")
            }
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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

