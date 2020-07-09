//
//  TodoEndpoint.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire


enum TodoEndpoint {
    case getTodo
}

extension TodoEndpoint: Endpoint {

    var path: String {
        switch self {
        case .getTodo:
            return "todos"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getTodo:
            return .get
        }
    }
    var parameters: [String : Any] {
        switch self {
        case .getTodo:
            return [:]
        }
    }
    
    func asURL() throws -> URL {
        return AppURL.main.appendingPathComponent(path)
    }
}



