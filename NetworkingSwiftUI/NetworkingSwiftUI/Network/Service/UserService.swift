//
//  UserService.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 10/27/21.
//

import Foundation
import Combine


protocol UserServiceProtocol {
    func getUser() -> Future<[User], Error>
}

class UserService: UserServiceProtocol {
    
    private let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    func getUser() -> Future<[User], Error> {
        let endpoint = UserEndpoint.getUser
        return service.request(endpoint: endpoint, type: [User].self)
    }
    
}
