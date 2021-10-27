//
//  Provider.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 10/27/21.
//

import Foundation


class Provider {
    
    static private let service = Service()
    
    static var userService: UserServiceProtocol = UserService(service: service)
    static var postService: PostServiceProtocol = PostService(service: service)
    
    private init() {}
}
