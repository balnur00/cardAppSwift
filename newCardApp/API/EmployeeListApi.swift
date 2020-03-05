//
//  EmployeeListApi.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//


import Alamofire
import AlamofireObjectMapper

struct EmployeeListAPI {
//    typealias employeesResponse = (Result<[Employee]>) -> Void
    typealias responseList = (Result<Response>) -> Void
    
    public static func getEmployees(_ completion: @escaping responseList)
    {
        let request = APIRouter.employeeList(nil)
        Alamofire
            .request(request)
            .responseJSON(completionHandler: { (response: DataResponse<Any>) in
                
                print("---------------------------------------------------------")
                print(request.method.rawValue.uppercased())
                print(request.path)
                print(request.parameters)
                print(response)
                
                if let json = response.result.value as? [String: Any] {
                    if let message = json["message"] as? String {
                        completion(Result.failure(APIError.badRequest(message)))
                    } else if let statusCode = json["statusCode "] as? Int {
                        if statusCode != 200 {
                            completion(Result.failure(APIError.badRequest("Произошла ошибка")))
                        }
                    }
                } else if response.response?.statusCode != 200 {
                    completion(Result.failure(APIError.badRequest("Произошла ошибка")))
                }
            })
//            .responseArray(keyPath: "") { (response: DataResponse<[Response]>) in
//
//                if let response = response.result.value {
//                    completion(Result.success(response))
//                }
//            }
            .responseObject(keyPath: "") {(response: DataResponse<Response>) in
                if let response = response.result.value {
                    completion(Result.success(response))
                }
            }
    }

    public static func getMoreEmployees(_ page: Int, completion: @escaping responseList)
    {
        let request = APIRouter.employeeList(page)
//        let baseURL = APIRouter.employeeListPage
//        var urlPage = baseURL as String + "\(page)"
        Alamofire
            .request(request)
            .responseJSON(completionHandler: { (response: DataResponse<Any>) in

                if let json = response.result.value as? [String: Any] {
                    if let message = json["message"] as? String {
                        completion(Result.failure(APIError.badRequest(message)))
                    } else if let statusCode = json["statusCode "] as? Int {
                        if statusCode != 200 {
                            completion(Result.failure(APIError.badRequest("Произошла ошибка")))
                        }
                    }
                } else if response.response?.statusCode != 200 {
                    completion(Result.failure(APIError.badRequest("Произошла ошибка")))
                }
            })
            .responseObject(keyPath: "") {(response: DataResponse<Response>) in
                print("---------------------------------------------------------")
                print(request.method.rawValue.uppercased())
                print(request.path)
                print(request.parameters ?? "")
                print(response)
                
                if let response = response.result.value {
                    completion(Result.success(response))
                }
            }
    }
    
}
