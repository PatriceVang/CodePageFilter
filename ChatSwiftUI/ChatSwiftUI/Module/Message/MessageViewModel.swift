//
//  MessageViewModel.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/18/21.
//

import Foundation
import SwiftUI
import Combine
import Firebase

class MessageViewModel: ObservableObject {
    
    @Published var difUser: ChatUser?
    @Published var chatUser: ChatUser?
    @Published var showMessageScreen: Bool = false
    @Published var isPushToChatScreen: Bool = false
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        FirebaseManager.shared.fetchCurrentUser {
            switch $0 {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let user):
                print(user)
                DispatchQueue.main.async {
                    self.chatUser = user
                }
            }
        }
    }
    
    
    func signOut() {
        FirebaseManager.shared.signOut { (error) in
            if let error = error {
                print(error)
                return
            }
            UserDefaultHelper.shared.isLogedIn = false
            UserDefaultHelper.shared.uid = ""
        }
    }
    
}
