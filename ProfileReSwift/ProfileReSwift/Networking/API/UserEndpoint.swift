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
}

extension UserEndpoint: Endpoint {
    var method: HTTPMethod {
        switch self {
        case .getUser:
            return .get
        }
    }
    
    var parameter: [String : Any] {
        switch self {
        case .getUser:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "users"
        }
    }
    
    func asURL() throws -> URL {
        return AppURL.test.appendingPathComponent(path)
    }
    
    
}
