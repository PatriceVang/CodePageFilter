//
//  PromiseNetwork.swift
//  ProfileReSwift
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//



//protocol NetworkProtocol {
//    func request<T: Codable>()
//}

import Foundation
import PromiseKit
import Alamofire



protocol PromiseNetworkProtocol {
    func requestObject<T: Codable>(endpoint: Endpoint) -> Promise<T>
    func requestArray<T: Codable>(endpoint: Endpoint) -> Promise<[T]>
}



class PromiseNetwork: PromiseNetworkProtocol {

    let network: AlmofireNetworkProtocol
    init(network: AlmofireNetworkProtocol) {
        self.network = network
    }
    
    func requestObject<T>(endpoint: Endpoint) -> Promise<T> where T : Decodable, T : Encodable {
        return Promise<T> { resolver in
            network.request(endpoint: endpoint, success: { (data) in
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    resolver.fulfill(result)
                } catch {
                    print(error.localizedDescription)
                    resolver.reject(error)
                }
            }) { (err) in
                print(err)
            }
            
        }
    }
    
    func requestArray<T>(endpoint: Endpoint) -> Promise<[T]> where T : Decodable, T : Encodable {
        return Promise<[T]> { resolver in
            network.request(endpoint: endpoint, success: { (data) in
                do {
                    let result = try JSONDecoder().decode([T].self, from: data)
                    resolver.fulfill(result)
                } catch {
                    print(error.localizedDescription)
                    resolver.reject(error)
                }
            }) { (err) in
                print(err.localizedDescription)
            }
        }
    }
    
    
    
}


