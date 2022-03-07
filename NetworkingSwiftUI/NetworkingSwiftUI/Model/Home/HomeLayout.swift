//
//  HomeLayout.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/7/22.
//

import Foundation


// MARK: - Result
struct HomeLayout: Codable {
    let justForYouList, lookbookIdeasList, saleItemsList, shopByCategoriesList: List
    let shopByBrandsList: List
}

// MARK: - List
struct List: Codable {
    let index: Int
    let type, title: String
    let products: [Product]?
    let lookbooks: [Lookbook]?
    let brands, categories: [Brand]?
}

// MARK: - Brand
struct Brand: Codable {
    let id, name: String
    let virtualPath: String
    let causes: [Cause]?
}

// MARK: - Cause
struct Cause: Codable {
    let id: String
    let virtualPath: String
    let colorCode: String
}

// MARK: - Lookbook
struct Lookbook: Codable {
    let id, name: String
    let favourite: Bool
    let userID, user: String
    let virtualPath: String

    enum CodingKeys: String, CodingKey {
        case id, name, favourite
        case userID = "userId"
        case user, virtualPath
    }
}

// MARK: - Product
struct Product: Codable {
    let id, name: String
    let brandName: BrandName
    let virtualPath: String
    let discount: Double
    let originalPrice: Int
    let salePrice: Double
    let creationTime: String
}

enum BrandName: String, Codable {
    case brandA = "Brand A"
    case brandB = "Brand B"
    case brandC = "Brand C"
    case brandD = "Brand D"
}

