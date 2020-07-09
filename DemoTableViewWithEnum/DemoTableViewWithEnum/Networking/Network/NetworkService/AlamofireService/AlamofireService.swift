//
//  AlamofireService.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//


import Alamofire

final class AlamofireService: NetworkServiceProtocol {
    
    
    func request(endpoint: Endpoint, success: @escaping (Data) -> Void, failure: @escaping (Error, Data?) -> Void) {

        AF.request(endpoint, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.method == .get ? URLEncoding.default : JSONEncoding.default, headers: nil)
        .validate()
        .responseData { (dataRespones) in
                switch dataRespones.result {
                case .success(let value):
                    success(value)
                case .failure(let error):
                    failure(error, dataRespones.data)
            }
        }
    }
    
    func upload(endpoint: Endpoint, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) {
        
    }
    
    
}


