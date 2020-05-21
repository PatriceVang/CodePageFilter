//
//  Presenter.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/16/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ObjectMapper


protocol PresenterHomeDelegate: class {
    func passDataVideos(data: [Videos])
    func passDataUtity(articles: [Articles])
}

protocol PresenterHomeProtocol {
    var view: PresenterHomeDelegate? { get set }
    func fetchDataVideos()
    func fetchDataUtity()
}


extension HomeVC {
    class Presenter: PresenterHomeProtocol {
        weak var view: PresenterHomeDelegate?
        func fetchDataVideos() {
             let urlVideos = "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json"
            APICaller.getMethod(url: urlVideos, header: nil, params: nil) { (data, err) in
                guard let data = data else {return}
                if err != nil {
                    print(err?.message as Any)
                } else {
                    guard let object = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) else {return}
                    let videos = Mapper<Videos>().mapArray(JSONArray: object as! [[String : Any]])
                    DispatchQueue.main.async {
                          self.view?.passDataVideos(data: videos)
                    }
                }
            }
        }
        func fetchDataUtity() {
            let urlArticles = "http://newsapi.org/v2/everything"
            let param = ["q":"bitcoin", "from": "2020-04-21", "sortBy": "publishedAt","apiKey": "01d16831688b4fb491ec6cec06fc8821"]
            APICaller.getMethod(url: urlArticles, header: nil, params: param) { (data, error) in
                guard let data = data else {return}
                if error != nil {
                    print(error?.message as Any)
                } else {
                    guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {return}
                    guard let newsVideos = Mapper<NewsVideos>().map(JSON: jsonObject as! [String : Any]) else {return}
                    DispatchQueue.main.async {
                        self.view?.passDataUtity(articles: newsVideos.articles!)
                    }
                }
            }
        }
    }
}

