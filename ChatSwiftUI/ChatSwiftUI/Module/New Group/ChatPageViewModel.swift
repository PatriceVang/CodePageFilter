//
//  ChatPageViewModel.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/30/21.
//

import Foundation
import Combine

class ChatPageViewModel: ObservableObject {
    @Published var chatUser: ChatUser
    @Published var chatText: String = ""
    @Published var messageError: String = ""
    @Published var chatMessages: [ChatMessage] = []
    
    init(user: ChatUser) {
        self.chatUser = user
    }
    
    func sendMessage() {
        guard let fromId  = FirebaseManager.shared.uid, chatText != "" else {return}
        let toId = chatUser.uid
        
        FirebaseManager.shared.saveMessageToFirestore(fromId: fromId, toId: toId, text: chatText, completion: { error in
            if let error = error {
                print("Saving message current user failed! \(error)")
                self.messageError = error
            }
            
            FirebaseManager.shared.saveMessageToFirestore(fromId: toId, toId: fromId, text: self.chatText) { (error) in
                if let error = error {
                    print("Saving message of recipent failed! \(error)")
                    self.messageError = error
                }
                self.chatText = ""
            }
        })
    }
    
    private func fetchMessages() {
        guard let fromId = FirebaseManager.shared.uid else {return}
        let toId = chatUser.uid
        FirebaseManager.shared.fetchMessages(fromId: fromId, toId: toId) { (result) in
            switch result {
            case .failure(let error):
                print("Fetch message error: \(error.localizedDescription)")
            case .success(let messages):
                print(messages)
                self.chatMessages += messages
            }
        }
    }
    
    
    
    
}
