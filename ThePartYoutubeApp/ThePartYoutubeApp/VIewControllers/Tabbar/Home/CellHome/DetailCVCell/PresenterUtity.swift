//
//  PresenterUtity.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/19/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ObjectMapper


protocol PresenterUtityDelegate: class {
    func passDataUtity(articles: [Articles])
}

protocol PresenterUtityProtocol {
    var view: PresenterUtityDelegate? {get set}
    func fetchDataUtity(url: String, header: [String: String]?, params: [String: Any]?)
}

extension UtityCellHome {
    class Presenter: PresenterUtityProtocol {
        weak var view: PresenterUtityDelegate?
        func fetchDataUtity(url: String, header: [String : String]?, params: [String : Any]?) {
            APICaller.getMethod(url: url, header: header, params: params) { (data, error) in
                guard let data = data else {return}
                if error != nil {
                    print(error?.message as Any)
                } else {
                    guard let object = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {return}
                    guard let newsVideos = Mapper<NewsVideos>().map(JSON: object as! [String : Any]) else {return}
                    guard let arrArticles = newsVideos.articles else {return}
                    DispatchQueue.main.async {
                        self.view?.passDataUtity(articles: arrArticles)
                    }
                }
            }
        }
        
       
        
    }
    
}
