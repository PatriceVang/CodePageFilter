//
//  PresenterUtity.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/19/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ObjectMapper


protocol PresenterUtityDelegate {
    func passDataUtity()
}

protocol PresenterUtityProtocol {
    var view: PresenterHomeDelegate? {get set}
    func fetchDataUtity(url: String, header: [String: String]?, params: [String: Any]?)
}

extension UtityCellHome {
    class Presenter: PresenterHomeProtocol {
        weak var view: PresenterHomeDelegate?
        func fetchDataVideos(url: String, header: [String : String]?, params: [String : Any]?) {
            APICaller.getMethod(url: url, header: header, params: params) { (data, error) in
                guard let data = data else {return}
                if error != nil {
                    print(error?.message as Any)
                } else {
                    guard let object = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {return}
                    let newsVideos = Mapper<NewsVideos>().map(JSON: object as! [String : Any])
                    print(newsVideos.map { $0.articles?.count })
                }
            }
        }
        
        
    }
    
}
