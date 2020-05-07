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
        return "https://image.tmdb.org/t/p/original\(profile_path ?? "")"
    }
    var known_for: [Interaction]?
    
    func isContain(language: HomeController.Language) -> Bool {
        guard let knownFor = self.known_for else { return false }
//        return knownFor.reduce(false) { ($1.original_language == language.rawValue) || $0 }
        
        
        return knownFor.reduce(false) { preResult, item in
            return preResult || item.original_language == language.rawValue
        }
    }
}

struct Interaction: Codable {
    // first
    var vote_average: Float?
    var original_language: String?
    var adult: Bool?
}

//true || true = true
//true || false = true
//false || false = false
//
//
//true && true = true
//true && false = false
//false && false = false
