//
//  UserEndpoint.swift
//  DemoVIPER
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire


enum UserEndpoint {
    case getUser
    case postUser(params: String)
}

extension UserEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .getUser:
            return "users"
        case .postUser:
            return "posts"
        }
    }
    
    
    var method: HTTPMethod {
        switch self {
        case .getUser:
            return .get
        case .postUser:
            return .post
        }
    }
    
    var params: [String : Any] {
        switch self {
        case .getUser:
            return [:]
        case .postUser(let params):
            return ["name": params]
        }
    }
    
    func asURL() throws -> URL {
        return AppURL.main.appendingPathComponent(path)
    }

}
