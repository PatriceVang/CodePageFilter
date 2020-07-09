//
//  TodoApi.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import PromiseKit

protocol TodoApiProtocol {
    func getTodo() -> Promise<[Todo]>
}

class TodoApi: TodoApiProtocol {
    
    let network: PromiseNetworkProtocol
    
    init(network: PromiseNetworkProtocol) {
        self.network = network
    }
    func getTodo() -> Promise<[Todo]> {
        let endpoint = TodoEndpoint.getTodo
        return network.requestArray(endpoint: endpoint)
    }
}


