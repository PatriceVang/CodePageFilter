//
//  Endpoint.swift
//  ProfileReSwift
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire


protocol Endpoint: URLConvertible {
    var method: HTTPMethod {get}
    var parameter: [String: Any] {get}
    var path: String {get}
}

