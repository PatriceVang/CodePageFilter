//
//  Error.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/7/22.
//

import Foundation


struct ApiError: Codable, Error {
    let code: Int?
    let message, details: String?
    let validationErrors: [ValidationError]?
    
    init(code: Int? = nil, message: String? = nil, details: String? = nil, validationErrors: [ValidationError]? = nil) {
        self.code = code
        self.message = message
        self.details = details
        self.validationErrors = validationErrors
    }
}

// MARK: - ValidationError
struct ValidationError: Codable {
    let message: String
    let members: [String]
}

