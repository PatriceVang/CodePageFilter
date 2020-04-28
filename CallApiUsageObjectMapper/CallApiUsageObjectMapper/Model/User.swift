//
//  Animals.swift
//  CallApiUsageObjectMapper
//
//  Created by Apple on 4/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ObjectMapper




class User: Mappable {
    var name: String?
    var address: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        address <- map["address.city"]
    }
    
    
}


