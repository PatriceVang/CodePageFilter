//
//  Request.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/2/22.
//

import Foundation
import Alamofire


class ApiRequest {
    let httpMethod: HTTPMethod
    let path: String
    let parameters: Parameters?
    
    init(httpMethod: HTTPMethod, path: String, parameters: Parameters? = nil) {
        self.httpMethod = httpMethod
        self.path = path
        self.parameters = parameters
    }
}



