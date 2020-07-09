//
//  SuccessReponse.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


public struct SuccessResponse {
    
    public struct Object<T: Codable>: Codable {
        public let status: Int
        public let data: T
    }
    
    public struct Array<T: Codable>: Codable {
        
//        public struct Data: Codable {
//            public let items: [T]
//            public let total: Int?
//        }
        
        public let status: Int
        public let data: T
        
    }
    
}
