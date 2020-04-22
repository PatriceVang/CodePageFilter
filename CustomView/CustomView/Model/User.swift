//
//  User.swift
//  CustomView
//
//  Created by Apple on 4/22/20.
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
    var token: Token?
    var fullName: String
    enum CodingKeys: String, CodingKey {
        case email, token, fullName = "full_name"
    }
}

struct Token: Codable {
    var token: String?
}
