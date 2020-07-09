//
//  NetworkingProvider.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

public final class NetworkingProvider {
    public static let shared: NetworkingProvider = NetworkingProvider()
    private let network: PromiseNetworkProtocol
    
    var user: UserApiProtocol {
        return UserApi(network: network)
    }
    
    var todo: TodoApiProtocol {
        return TodoApi(network: network)
    }

    private init() {
        let networkService = AlamofireService()
        network = PromiseNetwork(networkService: networkService)
    }
}

