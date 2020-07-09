//
//  PromiseNetworkProtocol.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import PromiseKit



protocol PromiseNetworkProtocol {
    func requestObject<T: Codable>(endpoint: Endpoint) -> Promise<T>
    func requestArray<T: Codable>(endpoint: Endpoint) -> Promise<[T]>
}


class PromiseNetwork: PromiseNetworkProtocol {
    
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    func requestObject<T: Codable>(endpoint: Endpoint) -> Promise<T> {
        return Promise<T> { resolver in
            self.networkService.request(endpoint: endpoint, success: { (data) in
                do {
                    let succcessReponse = try JSONDecoder().decode(T.self, from: data)
                    resolver.fulfill(succcessReponse)
                } catch  {
                    print(error)
                    resolver.reject(error)
                }
            }) { (error, data) in
                guard let data = data, let failureResponse = try? JSONDecoder().decode(FailureResponse.self, from: data) else {resolver.reject(error); return}
                resolver.reject(failureResponse.error)
            }
        }
    }
    
    func requestArray<T: Codable>(endpoint: Endpoint) -> Promise<[T]> {
        return Promise<[T]> { resolver in
            self.networkService.request(endpoint: endpoint, success: { (data) in
                do {
                    let successResponse = try JSONDecoder().decode([T].self, from: data)
                    resolver.fulfill(successResponse)
                } catch {
                    print(error)
                    resolver.reject(error)
                }
            }) { (error, data) in
                guard let data = data, let failureResponse = try? JSONDecoder().decode(FailureResponse.self, from: data) else {resolver.reject(error); return}
                resolver.reject(failureResponse.error)
            }
            
        }
    }
    
    
}
