//
//  Presenter.swift
//  FashionApp
//
//  Created by Apple on 4/18/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire

protocol PresenterHomeDelegate: class {
    func passDataActor(data: [Actor], totalPage: Int)
//    func passDataActorLoadMore(data: [Actor])
}

protocol PresenterHomeProtocol {
    var view: PresenterHomeDelegate? { get set }
//    func fetchData(url: URL)
    func fetchData(page: Int)
//    func fetchDataLoadMore(currentPage: Int)
}

class PresenterHome: PresenterHomeProtocol {

    weak var view: PresenterHomeDelegate?
    
    func fetchData(page: Int) {
        let url = "https://api.themoviedb.org/3/person/popular"
        let param: [String: Any] = ["api_key": "58d10a67ba0f9232e2f1b88e7e13cb1d", "language": "en-US", "page": page]
        DispatchQueue.global(qos: .userInteractive).async {
            if page >= 2 {
                sleep(1)
            }
            DispatchQueue.main.async {
                APICaller.getMethod(url: url, param: param, header: nil, T: JsonTotal.self) { (json, err) in
                    DispatchQueue.main.async {
                        self.view?.passDataActor(data: (json?.results)!, totalPage: json?.total_pages ?? 0)
                    }
                }
            }
        }
    }
    //Coable
//    func fetchData(url: URL) {
//        APICaller.getAPI(url: url, JsonTotal.self) { (json, err) in
//            DispatchQueue.main.async {
//                self.view?.passData(data: (json?.results)!)
//            }
//        }
//    }
}
