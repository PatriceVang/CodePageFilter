//
//  Presenter.swift
//  SampleMVP
//
//  Created by Vinova Dev on 4/15/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import Foundation

protocol MainViewProtocol: class {
    
    func onGetAllActorsComplete(actors: [ActorResponse])
    func onReceiveError(msg: String)
}

protocol MainPresenterProtocol: class {
    var view: MainViewProtocol? { get set }
    
    func getAllActors()
}

class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    
    
    func getAllActors() {
        URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/person/popular?api_key=58d10a67ba0f9232e2f1b88e7e13cb1d&language=en-US&page=1")!) { [weak self] (data, _, err) in
            if let err = err {
                self?.view?.onReceiveError(msg: err.localizedDescription)
                return
            }
            guard let data = data else { return }
            guard let response = try? JSONDecoder().decode(BaseResponse<[ActorResponse]>.self, from: data) else { return }
            DispatchQueue.main.async {
                self?.view?.onGetAllActorsComplete(actors: response.results)
            }
        }.resume()
    }
}




struct BaseResponse<Model: Codable>: Codable {
    var page: Int
    var totalResults: Int
    var totalPages: Int
    var results: Model
    
    enum CodingKeys: String, CodingKey {
        case page, totalResults = "total_results", totalPages = "total_pages", results
    }
}
