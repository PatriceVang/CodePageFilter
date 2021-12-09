//
//  ChatMessage.swift
//  ChatSwiftUI
//
//  Created by Apple on 12/9/21.
//

import Foundation



struct ChatMessage: Identifiable {
    var id: String {
        return documentId
    }
    private let documentId: String
    let fromId, toId, text: String

    
    init(json: [String: Any], documentId: String) {
        self.fromId = json["fromId"] as? String ?? ""
        self.toId = json["toId"] as? String ?? ""
        self.text = json["text"] as? String ?? ""
        self.documentId = documentId
    }
}
