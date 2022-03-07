//
//  ReviewService.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/2/22.
//

import Foundation
import Combine




class ReviewService {
    let service = Service()
    
    func createRating(userId: String, productId: String) -> Future<ApiResponse<Bool>, ApiError> {
        return service.request(apiRequest: ReviewRequest.createRating(userId: userId, productId: productId))
    }
}

