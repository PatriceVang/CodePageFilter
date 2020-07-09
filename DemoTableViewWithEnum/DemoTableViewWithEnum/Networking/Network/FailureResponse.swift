//
//  FailureResponse.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


public struct AppErr: Codable, Error {
    
    public struct Message: Codable {
        public let error: String
    }
    
    public let code: Int
    public let message: Message
    
}

public struct FailureResponse: Codable {
    public let status: Int
    public let error: AppErr
}
