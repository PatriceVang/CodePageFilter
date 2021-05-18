//
//  ApiEndpoint.swift
//  NetworkingCombine
//
//  Created by Apple on 5/14/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation

//

protocol ApiEndpoint {
    var urlRequest: URLRequest {get}
    var baseUrl: URL {get}
    var path: String {get}
}
