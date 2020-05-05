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
    func passDataActor(data: [Actor])
    func passDataActorLoadMore(data: [Actor])
}

protocol PresenterHomeProtocol {
    var view: PresenterHomeDelegate? { get set }
//    func fetchData(url: URL)
    func fetchData()
    func fetchDataLoadMore()
}

class PresenterHome: PresenterHomeProtocol {

    weak var view: PresenterHomeDelegate?
    
    func fetchData() {
        let url = "https://api.themoviedb.org/3/person/popular"
        let param = ["api_key": "58d10a67ba0f9232e2f1b88e7e13cb1d", "language": "en-US", "page": "1"]
        APICaller.getMethod(url: url, param: param, header: nil, T: JsonTotal.self) { (json, err) in
            DispatchQueue.main.async {
                self.view?.passDataActor(data: (json?.results)!)
            }
        }
    }
    func fetchDataLoadMore() {
        let url = "https://api.themoviedb.org/3/person/popular"
        let param = ["api_key": "58d10a67ba0f9232e2f1b88e7e13cb1d", "language": "en-US", "page": "2"]

        DispatchQueue.global(qos: .utility).async {
            sleep(2)
            APICaller.getMethod(url: url, param: param, header: nil, T: JsonTotal.self) { (json, err) in
                DispatchQueue.main.async {
                    self.view?.passDataActorLoadMore(data: (json?.results)!)
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
