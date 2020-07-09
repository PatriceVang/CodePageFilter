//
//  Endpoint.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire


protocol Endpoint: URLConvertible {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
}
