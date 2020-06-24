//
//  Course.swift
//  MVVMOne
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation



//struct User: Codable {
//    var name: String?
//    var email: String?
//    var phone: String?
//    var website: String?
//
//    func getAddress() -> String {
//        return "\(phone ?? "") - \(website ?? "") "
//    }
//}


struct DataUser: Codable {
    var items: [User]
}


struct User: Codable {
    var name: String?
    var image: String?
    
    
    enum CodingKeys: String, CodingKey {
        case name = "login", image = "avatar_url"
    }
}
