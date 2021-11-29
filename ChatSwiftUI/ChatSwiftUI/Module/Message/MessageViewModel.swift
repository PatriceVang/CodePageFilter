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
    
    @Published var chatUser: ChatUser?
    
    
    init() {
        FirebaseManager.shared.fetchCurrentUser {
            switch $0 {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let user):
                print(user)
                self.chatUser = user
            }
        }
    }
    
}
