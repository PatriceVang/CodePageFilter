//
//  UserEndpoint.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire



enum UserEndpoint {
    case getUser
    case login(params: User.Parameters.Login)
}

extension UserEndpoint: Endpoint {
    var path: String {
        switch self {
        case .getUser:
            return "users"
        case .login:
            return "login"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUser:
            return .get
        case .login:
            return .post
        }
    }
   
    var parameters: [String : Any] {
        switch self {
        case .getUser:
            return [:]
        case .login(let params):
            return params.toJSON()
        }
    }
    
    func asURL() throws -> URL {
        return AppURL.main.appendingPathComponent(path)
    }
}


extension Encodable {
    func toJSON() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
            let jsonDic = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {return [:]}
        return jsonDic
    }
}
 
