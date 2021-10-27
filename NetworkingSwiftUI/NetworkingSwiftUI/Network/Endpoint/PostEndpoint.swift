//
//  PostEndpoint.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 10/27/21.
//

import Foundation

enum PostEndpoint {
    case createPost(id: Int, title: String)
    case listPost
}

extension PostEndpoint: EndointType {
    var method: HttpMethod {
        switch self {
        case .createPost:
            return .POST
        default:
            return .GET
        }
    }
    
    var body: [String : Any] {
        switch self {
        case .createPost(let id, let title):
            return ["id": id, "title": title]
        default:
            return [:]
        }
    }
    
    var url: String {
        switch self {
        case .createPost:
            return "/posts"
        default:
            return ""
        }
    }
    
}
