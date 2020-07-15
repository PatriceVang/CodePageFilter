//
//  NetworkiProvider.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation

protocol NetworkProviderProtocol {
    var userApi: UserApiProtocol {get}
}


class NetworkProvider: NetworkProviderProtocol {
    static let shared = NetworkProvider()
    
    private var network: PromiseNetworkProtocol
    private init() {
        let almofireNetwork = AlmofireNetwork()
        network = PromiseNetwork(network: almofireNetwork)
    }
    
     var userApi: UserApiProtocol {
        return UserApi(network: network)
    }

}
