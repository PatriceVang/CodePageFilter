//
//  PromiseApi.swift
//  DemoVIPER
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

protocol PromiseApi {
    func request<T: Codable>(endpoint: Endpoint) -> Promise<T>
    func requestArray<T:Codable>(endpoint: Endpoint) -> Promise<[T]>
}


class PromiseNetwork: PromiseApi {
    func request<T>(endpoint: Endpoint) -> Promise<T> where T : Decodable, T : Encodable {
        return Promise { (resolver) in
            AF.request(endpoint, method: endpoint.method, parameters: endpoint.params).responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = try? JSONDecoder().decode(T.self, from: value as! Data)
                    resolver.fulfill(json!)
                case .failure(let err):
                    resolver.reject(err)
                }
            }
        }
    }
    
    func requestArray<T>(endpoint: Endpoint) -> Promise<[T]> where T : Decodable, T : Encodable {
        return Promise { (resolver) in
            AF.request(endpoint, method: endpoint.method, parameters: endpoint.params).responseData { (response) in
                switch response.result {
                case .success(let data):
                    let json = try? JSONDecoder().decode([T].self, from: data)
                    resolver.fulfill(json!)
                case .failure(let err):
                    resolver.reject(err)
                }
            }
        }
    }
}
