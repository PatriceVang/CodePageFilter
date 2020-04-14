//
//  Model.swift
//  FashionApp
//
//  Created by Apple on 4/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


struct JsonTotal: Codable {
    var page: Int?
    var total_results: Int?
    var total_pages: Int?
    var results: [Actor]?
}
struct Actor: Codable {
    var popularity: Float?
    var name: String?
    private var profile_path: String?
    var picture : String {
        return "https://image.tmdb.org/t/p/original\(profile_path!)"
    }
    var known_for: [Interaction]?
}
//
struct Interaction: Codable {
    var vote_average: Float?
}




