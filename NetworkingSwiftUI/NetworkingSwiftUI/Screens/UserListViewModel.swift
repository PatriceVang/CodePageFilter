//
//  UserListViewModel.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 10/27/21.
//

import Foundation
import Combine


class UserListViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var post = Post()
    
    private var cancellableSet: Set<AnyCancellable> = []
    init() {
        getUser()
    }
    
    func getUser() {
        Provider.userService.getUser().sink {
            switch $0 {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("OK")
            }
        } receiveValue: { (users) in
            self.users = users
        }.store(in: &cancellableSet)

    }
    
    func createNewPost() {
        Provider.postService.createPost(id: 1000, title: "Data").sink {
            switch $0 {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("New Post")
            }
        } receiveValue: { (post) in
            
            self.post = post
        }.store(in: &cancellableSet)

    }

}
