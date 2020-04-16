//
//  ActorResponse.swift
//  SampleMVP
//
//  Created by Vinova Dev on 4/15/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import Foundation


struct ActorResponse: Codable {
    var popularity: Float
    var name: String
    
    private var avatarPath: String
    var avatarUrl: String {
        return "https://image.tmdb.org/t/p/original\(avatarPath)"
    }
    
    enum CodingKeys: String, CodingKey {
        case popularity, avatarPath = "profile_path", name
    }
}
