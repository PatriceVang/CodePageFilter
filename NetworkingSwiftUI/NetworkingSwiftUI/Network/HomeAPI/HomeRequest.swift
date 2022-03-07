//
//  HomeRequest.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/7/22.
//

import Foundation


class HomeRequest {
    static func homeLayout() -> ApiRequest {
        return ApiRequest(httpMethod: .get, path: "/layout/home")
    }
}
