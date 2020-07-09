//
//  URL.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


//https://jsonplaceholder.typicode.com/users

public struct AppURL {
    static let https = "https://"
    static let http = "http://"
    static let host = "jsonplaceholder.typicode.com/"

    
    public struct FM_DEV {
        public static let main = https + host
    }
    
    public struct FM_STAG {
        public static let main = https + host
    }
    
    public struct FM_PROD {
         public static let main = https + host
    }
    
    static var main: URL {
        guard let url = URL(string: self.FM_DEV.main) else { fatalError("Invalid base url")}
        return url
    }
    
    private init(){}
    
}
