//
//  ChatUser.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/19/21.
//

import Foundation



struct ChatUser: Identifiable {
    var id: String {
        return uid
    }
    
    var uid, email, avatar: String
    
    init(json: [String: Any]) {
        self.uid = json["uid"] as? String ?? ""
        self.email = json["email"] as? String ?? ""
        self.avatar = json["avatar"] as? String ?? ""
    }
    
    init() {
        self.uid = ""
        self.email = ""
        self.avatar = ""
    }

}

