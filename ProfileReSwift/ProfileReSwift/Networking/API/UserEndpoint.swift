//
//  UserEndpoint.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire


enum UserEndpoint {
    case getUser
    case createUser(params: [String: Any])
}

extension UserEndpoint: Endpoint {
    var method: HTTPMethod {
        switch self {
        case .getUser:
            return .get
        case .createUser:
            return .post
        }
    
    }
    
    var parameter: [String : Any] {
        switch self {
        case .getUser:
            return [:]
        case .createUser(let params):
            return params
        }
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "users"
        case .createUser:
            return "posts"
        }
    }
    
    func asURL() throws -> URL {
        return AppURL.test.appendingPathComponent(path)
    }
    
    
}
