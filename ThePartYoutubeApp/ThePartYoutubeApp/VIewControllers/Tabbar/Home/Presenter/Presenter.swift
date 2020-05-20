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
    func fetchDataVideos(url: String, header: [String: String]?, params: [String: Any]?)
    func fetchDataUtity(url: String, header: [String: String]?, params: [String: Any]?)
}


extension HomeVC {
    class Presenter: PresenterHomeProtocol {
        weak var view: PresenterHomeDelegate?
        func fetchDataVideos(url: String, header: [String : String]?, params: [String : Any]?) {
            APICaller.getMethod(url: url, header: header, params: params) { (data, err) in
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
        func fetchDataUtity(url: String, header: [String : String]?, params: [String : Any]?) {
            APICaller.getMethod(url: url, header: header, params: params) { (data, error) in
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

