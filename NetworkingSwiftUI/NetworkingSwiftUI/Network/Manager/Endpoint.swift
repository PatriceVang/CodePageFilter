//
//  Endpoint.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 10/27/21.
//

import Foundation

protocol EndointType {
    var method: HttpMethod {get}
    var body: [String: Any] {get}
    var url: String {get}
}


enum HttpMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}


