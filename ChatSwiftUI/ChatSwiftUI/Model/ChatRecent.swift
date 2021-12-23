//
//  ChatRecent.swift
//  ChatSwiftUI
//
//  Created by Apple on 12/23/21.
//

import Foundation
import Firebase



struct ChatRecent: Identifiable {
    
    var id: String {
        return documentId
    }
    
    let text, fromId, toId, avatar, email: String
    var timestamp: Timestamp = Timestamp(date: Date())
    let documentId: String
    
    init(dictionary: [String: Any], documentId: String) {
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.text =  dictionary["text"] as? String ?? ""
        self.fromId =  dictionary["fromId"] as? String ?? ""
        self.toId =  dictionary["toId"] as? String ?? ""
        self.avatar =  dictionary["avatar"] as? String ?? ""
        self.email =  dictionary["email"] as? String ?? ""
        self.documentId = documentId
    }
    
    init() {
        self.text = ""
        self.fromId = ""
        self.toId = ""
        self.avatar = ""
        self.email = ""
        self.documentId = ""
    }
}
