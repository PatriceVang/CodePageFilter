//
//  Settings.swift
//  FashionApp
//
//  Created by Apple on 5/4/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ObjectMapper


let data_ = """
[
    {
        "image": "ic_settings",
        "title": "Settings"
    },
    {
        "image": "ic_shutdown",
        "title": "Logout"
    }
]
""".data(using: .utf8)!


class Settings: Mappable {
    var image: String?
    var title: String?
    required init?(map: Map) {

    }
    func mapping(map: Map) {
        image <- map["image"]
        title <- map["title"]
    }
}
