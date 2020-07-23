//
//  ApiLogin.swift
//  DemoReactCocoA
//
//  Created by Apple on 7/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Moya


let UserProvider = MoyaProvider<APIUser>()

enum APIUser {
    case getUser
    case postUser(params: String)
}
extension APIUser: TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/")!
    }

    var path: String {
        switch self {
        case .getUser:
            return "users"
        case .postUser:
            return "posts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUser:
            return .get
        case .postUser:
            return .post
        }
    }
        
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getUser:
            return .requestPlain
        case .postUser(let params):
            return .requestParameters(parameters: ["name": params], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUser:
            return nil
        case .postUser:
            return nil
        }
    }
    
//    func url(_ route: TargetType) -> String {
//        return route.baseURL.appendingPathComponent(route.path).absoluteString
//    }
}


