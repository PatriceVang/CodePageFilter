//
//  VIdeos.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/16/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ObjectMapper

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

class Articles: Mappable {
    var image: String?
    var author: String?
    var title: String?
    var published: String?
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        image <- map["articles.urlToImage"]
        author <- map["articles.author"]
        title <- map["articles.author"]
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//
//        if let dateString = map["articles.publishedAt"].currentValue as? String, let _date = dateFormatter.date(from: dateString) {
//            published = _date
//        }
        
        let transform = TransformOf<String, Date>(fromJSON: { (value) -> String? in
            return dateFormatter.string(from: value!)
        }) { (value) -> Date? in
            return dateFormatter.date(from: value!)
        }
        
         published <- (map["articles.publishedAt"], transform)
    }
}


