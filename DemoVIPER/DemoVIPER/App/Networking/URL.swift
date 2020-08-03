//
//  URL.swift
//  DemoVIPER
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


struct AppURL {
    static let https = "https://"
    static let host = "jsonplaceholder.typicode.com/"
    
    static var main: URL {
        let url = https + host
        return URL(string: url)!
    }
}
