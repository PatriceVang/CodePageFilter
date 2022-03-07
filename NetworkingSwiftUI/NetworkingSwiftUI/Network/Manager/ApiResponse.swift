//
//  ApiResponse.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/2/22.
//

import Foundation


struct ApiResponse<T: Codable>: Codable {
    let result: T?
    let error: ApiError?
}

