//
//  ReviewService.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/2/22.
//

import Foundation
import Combine




class ReviewService {
    private let service: ApiService
    
    init(service: ApiService) {
        self.service = service
    }
    
    func getRatingDetai(productId: String) -> Future<RatingDetail, ApiError> {
        return service.request(apiRequest: ReviewRequest.ratingDetail(productId: productId))
    }
    
    func createRating(userId: String, productId: String) -> Future<Bool, ApiError> {
        return service.request(apiRequest: ReviewRequest.createRating(userId: userId, productId: productId))
    }
}

