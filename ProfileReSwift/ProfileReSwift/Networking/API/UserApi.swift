//
//  UserApi.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import PromiseKit



protocol UserApiProtocol {
    func getUser() -> Promise<[User]>
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
    
    
}



