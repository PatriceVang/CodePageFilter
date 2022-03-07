//
//  HomeService.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/7/22.
//

import Foundation
import Combine

class HomeService {
    private let service: ApiService
    
    init(service: ApiService) {
        self.service = service
    }
    
    
    func getLayoutHome() -> Future<HomeLayout, ApiError> {
        return service.request(apiRequest: HomeRequest.homeLayout())
    }
    
}
