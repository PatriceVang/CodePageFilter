//
//  UserService.swift
//  NetworkingCombine
//
//  Created by Apple on 5/14/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import Combine

protocol UserServiceProtocol {
    func getUser() -> Future<[User], APIError>
}

struct UserService: UserServiceProtocol {
    
    let service = APIService()
    
    init() {
        
    }
    
    func getUser() -> Future<[User], APIError> {
        let endPoint = UserEndpoint.getUser
        return service.request(endPoint, [User].self)
    }
    

}
