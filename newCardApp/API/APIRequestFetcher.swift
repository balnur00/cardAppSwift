//
//  APIRequestFetcher.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/27/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class APIRequestFetcher {
    
    var searchResults = [JSON]()
    typealias employeesResponse = (Result<[Employee]>) -> Void
    
    func search(searchText: String, completionHandler: @escaping employeesResponse){
//        let urlToSearch = App.baseURL + "?search=" + \(searchText)
    }
}
