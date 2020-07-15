//
//  AppURL.swift
//  ProfileReSwift
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire
//https://jsonplaceholder.typicode.com/users

struct AppURL {
    static let https = "https://"
    static let http = "http://"
    static let host = "gofix.com.sg"
    static let hostTest = "jsonplaceholder.typicode.com/"
    
    static var test: URL {
        let str = https + hostTest
        guard let url = URL(string: str) else {
            fatalError()
        }
        return url
    }

    static var main: URL {
        let str = https + host
        guard let url = URL(string: str) else {
            fatalError()
        }
        return url
    }
    
}
