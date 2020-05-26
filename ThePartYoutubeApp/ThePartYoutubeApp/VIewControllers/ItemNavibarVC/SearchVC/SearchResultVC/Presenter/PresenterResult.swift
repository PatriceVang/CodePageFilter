//
//  PresenterSearchResult.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/21/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ObjectMapper

protocol PresenterResultDelegate: class {
    func passDataSearchResult(data: [Articles])
}

protocol PresenterSearchResultProtocol {
    var view: PresenterResultDelegate? {get set}
    func fetchDataSearchResult(text: String)
   
}

extension ResultVC {
    class Presenter: PresenterSearchResultProtocol {
        weak var view: PresenterResultDelegate?
        func fetchDataSearchResult(text: String) {
            let url = "http://newsapi.org/v2/everything"
            let params = ["q":"\(text)", "from": "2020-04-26", "sortBy": "publishedAt","apiKey": "01d16831688b4fb491ec6cec06fc8821"]
            APICaller.getMethod(url: url, header: nil, params: params) { (data, error) in
                guard let data = data else {return}
                if error != nil {
                    print(error?.message as Any)
                } else {
                    guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {return}
                    guard let newsVideos = Mapper<NewsVideos>().map(JSON: jsonObject as! [String : Any]) else {return}
                    DispatchQueue.main.async {
                        self.view?.passDataSearchResult(data: newsVideos.articles!)
                    }
                }
            }
        }
        
    }
}
