//
//  Endpoint.swift
//  DemoVIPER
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire

protocol Endpoint: URLConvertible {
    var path: String {get}
    var method: HTTPMethod {get}
    var params: [String: Any] {get}
}




