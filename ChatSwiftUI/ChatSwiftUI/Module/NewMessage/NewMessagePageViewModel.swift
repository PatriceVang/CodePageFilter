//
//  NewMessagePageModel.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/30/21.
//

import Foundation
import Combine



class NewMessageViewModel: ObservableObject {
    @Published var users = [ChatUser]()
    
    init() {
        fetchAllUser()
    }
    
    func fetchAllUser() {
        FirebaseManager.shared.fetchAllUser { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                }
            }
        }
    }
}
