//
//  APIError.swift
//  NetworkingCombine
//
//  Created by Apple on 5/14/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation


enum APIError: Error {
    case decodingFailure
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingFailure:
            return "Decode to object failed"
        case .errorCode(let code):
            return "\(code) someting went wrong"
        case .unknown:
            return "The error is undefine"
        }
    }
}
