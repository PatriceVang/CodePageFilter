//
//  User.swift
//  DemoMVC
//
//  Created by Apple on 5/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ObjectMapper

//Model chi xu li logic lien quan toi model (format)
class Result<T: Mappable>: Mappable {
    var result: T?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        result <- map["result"]
    }
}



class User: Mappable {
    var name: String?
    var street: String?
    var city: String?
    var company: String?
    var fullAdd: String?
    
    required init?(map: Map) {
    }
    func getFullAddress() -> String {
        return "Street: \(street ?? "")\nCity: \(city ?? "")\nCompany: \(company ?? "")"
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        street <- map["address.street"]
        city <- map["address.city"]
        company <- map["company.name"]
    }
}



