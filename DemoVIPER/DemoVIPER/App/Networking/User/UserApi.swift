//
//  UserApi.swift
//  DemoVIPER
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import PromiseKit

protocol UserApiProtocol {
    func getUser() -> Promise<[User]>
}

class UserApi: UserApiProtocol {
    
    
    let network: PromiseApi
    
    init(network: PromiseApi) {
        self.network = network
    }
    
    func getUser() -> Promise<[User]> {
        let endpoint = UserEndpoint.getUser
        return network.requestArray(endpoint: endpoint)
    }

}
