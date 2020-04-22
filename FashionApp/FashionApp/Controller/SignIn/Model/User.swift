//
//  User.swift
//  FashionApp
//
//  Created by Apple on 4/21/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation

struct Object: Codable {
    var user: User?
    enum CodingKeys: String, CodingKey {
        case user = "data"
    }
}

struct User: Codable {
    var id: String?
    var email: String?
    var fullName: String?
    var avatar: String
    var token: Token?
    
    enum CodingKeys: String, CodingKey {
        case id, email, avatar, token
        case fullName = "full_name"
    }
}

struct Token: Codable {
    var token: String
    var expireAt: String
    var refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case token, expireAt = "expired_at", refreshToken = "refresh_token"
    }
}
