//
//  UserRequest.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/2/22.
//

import Foundation


class ReviewRequest {
    static func ratingDetail(productId: String) -> ApiRequest {
        return ApiRequest(
            httpMethod: .get,
            path: "/reviews/rating-detail",
            parameters: ["productid": productId]
        )
    }
    static func userRatingList(productId: String) -> ApiRequest {
        return ApiRequest(
            httpMethod: .get,
            path: "/reviews/get-list-by-product-id",
            parameters: ["productid": productId]
        )
    }
    
    static func createRating(userId: String, productId: String) -> ApiRequest {
        return ApiRequest(
            httpMethod: .post,
            path: "/reviews/create",
            parameters: [
                "describedRating": 5,
                "communicateRating": 5,
                "shippingRating": 5,
                "description": "5",
                "userId": userId,
                "productId": productId,
            ]
        )
    }
}
