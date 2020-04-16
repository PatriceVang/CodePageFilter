//
//  MovieDBApi.swift
//  SampleMVP
//
//  Created by Vinova Dev on 4/15/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import Foundation


class MovieDBApi: APICaller {
    
    typealias apiOperator = MovieDBApiOperator
    var baseUrl: String
    var imgUrlPrefix = "https://image.tmdb.org/t/p/original/"
    
    init(baseUrl: String) { self.baseUrl = baseUrl }
}


enum MovieDBApiOperator: APIOperator {
    case getAllUsers
    
    var endPoint: Endpoint {
        switch self {
        case .getAllUsers:
            return Endpoint(
                url: "people",
                method: .get,
                param: nil,
                header: nil
            )
        }
    }
}
