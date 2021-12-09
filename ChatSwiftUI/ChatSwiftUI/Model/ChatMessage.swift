//
//  ChatMessage.swift
//  ChatSwiftUI
//
//  Created by Apple on 12/9/21.
//

import Foundation



struct ChatMessage {
    let fromId, toId, text: String
    
    init(json: [String: Any]) {
        self.fromId = json["fromId"] as? String ?? ""
        self.toId = json["toId"] as? String ?? ""
        self.text = json["text"] as? String ?? ""
    }
}
