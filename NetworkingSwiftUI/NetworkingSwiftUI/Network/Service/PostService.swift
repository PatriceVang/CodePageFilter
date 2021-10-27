//
//  PostService.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 10/27/21.
//

import Foundation
import Combine

protocol PostServiceProtocol {
    func createPost(id: Int, title: String) -> Future<Post, Error>
}

class PostService: PostServiceProtocol {
   

    private let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    func createPost(id: Int, title: String) -> Future<Post, Error> {
        let endpoint = PostEndpoint.createPost(id: id, title: title)
        return service.request(endpoint: endpoint, type: Post.self)
    }
    
    
}
