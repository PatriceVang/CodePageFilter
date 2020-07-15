//
//  AlamofireNetwork.swift
//  ProfileReSwift
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

protocol AlmofireNetworkProtocol {
    func request(endpoint: Endpoint, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void )
}

class AlmofireNetwork: AlmofireNetworkProtocol {
    func request(endpoint: Endpoint, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) {
        AF.request(endpoint, method: endpoint.method, parameters: nil).responseData { (response) in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let err):
                failure(err)
            }
        }
    }
    
    
}
