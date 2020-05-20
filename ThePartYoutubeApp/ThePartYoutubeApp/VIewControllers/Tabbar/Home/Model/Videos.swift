//
//  VIdeos.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/16/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ObjectMapper


open class ISODateTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = String

    public init() {}

    public func transformFromJSON(_ value: Any?) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    guard let strValue = value as? String else { return nil }
    return formatter.date(from: strValue)
    }

    public func transformToJSON(_ value: Date?) -> String? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    guard value != nil else { return nil }
    return formatter.string(from: value!)
    }
}

class Videos: Mappable {
    var title: String?
    var views: Int?
    var image: String?
    var name: String?
    var profileImg: String?
    var duration: Int?
    
    required init?(map: Map) {        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        views <- (map["number_of_views"])
        image <- map["thumbnail_image_name"]
        name <- map["channel.name"]
        profileImg <- map["channel.profile_image_name"]
        duration <- map["duration"]
    }
}

class NewsVideos: Mappable {
    var status: String?
    var result: String?
    var articles: [Articles]?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        status <- map["status"]
        result <- map["totalResults"]
        articles <- map["articles"]
    }
}

class Articles:  Mappable {
    var image: String?
    var author: String?
    var title: String?
    var published: String?
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
//        let transform = TransformOf<Date, String>(fromJSON: { (value) -> Date? in
//            return dateFormatter.date(from: value!)
//        }) { (value) -> String? in
//            return dateFormatter.string(from: value!)
//        }
        
//        published <- (map["publishedAt"], ISODateTransform())
        published <- map["publishedAt"]
        image <- map["urlToImage"]
        author <- map["author"]
        title <- map["title"]
        
    }
}


