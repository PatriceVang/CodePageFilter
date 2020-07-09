//
//  UserApi.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import PromiseKit


protocol UserApiProtocol {
    func getUser() -> Promise<[User]>
    func login(params: User.Parameters.Login) -> Promise<User>
}

class UserApi: UserApiProtocol {
  
    
  
    
    
    let network: PromiseNetworkProtocol
    
    init(network: PromiseNetworkProtocol) {
        self.network = network
    }
    
    func getUser() -> Promise<[User]> {
        let endpoint = UserEndpoint.getUser
        return network.requestArray(endpoint: endpoint)
    }
    
    func login(params: User.Parameters.Login) -> Promise<User> {
        let endpoint = UserEndpoint.login(params: params)
        return network.requestObject(endpoint: endpoint)
    }
  
}



