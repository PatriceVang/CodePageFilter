//
//  UserEndpoint.swift
//  NetworkingCombine
//
//  Created by Apple on 5/14/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation




enum UserEndpoint {
    case getUser
}

extension UserEndpoint: ApiEndpoint {
    var urlRequest: URLRequest {
        return URLRequest(url: baseUrl.appendingPathComponent(path))
    }
    
    var baseUrl: URL {
        return BaseURL.baseUrl
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "/users"
        }
    }
    
    
}
