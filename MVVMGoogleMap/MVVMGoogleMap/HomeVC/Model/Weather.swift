//
//  Weather.swift
//  MVVMGoogleMap
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ObjectMapper




class UserItems: Mappable {
    var items: [User]?
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        items <- map["items"]
    }
    
    
}

class User: Mappable {
    var name: String?
    var id: Int?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["items.login"]
        id <- map["items.id"]
    }
}
