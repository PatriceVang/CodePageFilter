//
//  NetworkServiceProtocol.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


protocol NetworkServiceProtocol {
    func request(endpoint: Endpoint, success: @escaping (Data) -> Void, failure: @escaping (Error, Data?) -> Void)
    func upload(endpoint: Endpoint, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void)
}
