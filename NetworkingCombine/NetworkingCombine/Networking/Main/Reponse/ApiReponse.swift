//
//  ApiReponse.swift
//  NetworkingCombine
//
//  Created by Apple on 5/14/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation


struct ApiReponse<T: Codable>: Codable {
    var data: T
    init(data: T) {
        self.data = data
    }
}
