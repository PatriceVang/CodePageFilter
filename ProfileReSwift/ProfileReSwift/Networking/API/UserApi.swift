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
    func createUser(params: [String: Any]?) -> Promise<Post>
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
    func createUser(params: [String : Any]?) -> Promise<Post> {
        let endpoint = UserEndpoint.createUser(params: params!)
        return network.requestObject(endpoint: endpoint)
    }

}



