//
//  RatingDetail.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/2/22.
//

import Foundation

struct RatingDetail: Codable {
    var reviewNumber: Int?
    var overallRating: Double?
    var percentDescribedRating: Double?
    var percentCommunicateRating: Double?
    var percentShippingRating: Double?
}
