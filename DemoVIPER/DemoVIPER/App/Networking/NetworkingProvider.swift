//
//  NetworkingProvider.swift
//  DemoVIPER
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


protocol NetworkingProviderProtocol {
    var getUser: UserApiProtocol {get}
}

class NetworkingProvider: NetworkingProviderProtocol {

    static let shared = NetworkingProvider()

    let network: PromiseApi
    

    init() {
        network = PromiseNetwork()
    }
    
    var getUser: UserApiProtocol {
        return UserApi(network: network)
    }
    
    
}
