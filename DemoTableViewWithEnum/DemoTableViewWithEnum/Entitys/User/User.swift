//
//  User.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


class User: Codable {
    var name: String?
    var city: String?

    enum UserKeys: String, CodingKey {
        case name
        case address = "address"
    }

    enum AddressKeys: String, CodingKey {
        case city = "city"
    }

    init(decoder: Decoder) throws {
        if let userContainer = try? decoder.container(keyedBy: UserKeys.self) {
            self.name = try userContainer.decode(String.self, forKey: .name)

            if let cityContainer = try? decoder.container(keyedBy: AddressKeys.self) {
                self.city = try cityContainer.decode(String.self, forKey: .city)
            }
        }

    }
    

}

extension User {
    struct Parameters {
    }
}

extension User.Parameters {
    struct Login: Codable {
        var name: String?
        var city: String?
        
        
        init(name: String, city: String) {
            self.name = name
            self.city = city
        }
    }
}
