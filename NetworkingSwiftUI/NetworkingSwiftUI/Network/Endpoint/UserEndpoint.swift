//
//  UserEndpoint.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 10/27/21.
//

import Foundation


enum UserEndpoint {
    case getUser
    case postUser
}

extension UserEndpoint: EndointType {
    var method: HttpMethod {
        switch self {
        case .postUser:
            return .POST
        default:
            return .GET
        }
    }

    
    var body: [String : Any] {
        switch self {
        case .getUser:
            return [:]
        default:
            return [:]
        }
    }
    
    var url: String {
        switch self {
        case .getUser:
            return "/users"
        default:
            return ""
        }
    }
    
}
