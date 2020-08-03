//
//  FruitInterator.swift
//  DemoVIPER
//
//  Created by Apple on 7/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


class UserInteractor: UserInteractorProtocol {
    
    weak var presenter: UserInteractorOutputProtocol?
    
    func fetchData() {
//        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
//        let task = URLSession.shared.dataTask(with: url!) { (data, _, err) in
//            do {
//                guard let data = data else {return}
//
//                let json = try JSONDecoder().decode([User].self, from: data)
//
//                DispatchQueue.main.async {
//                    self.presenter?.didSuccess(user: json)
//                }
//            } catch {
//                self.presenter?.didFail(err: error.localizedDescription)
//            }
//        }
//
//        task.resume()
        
        
        NetworkingProvider.shared.getUser.getUser().done { (user) in
            self.presenter?.didSuccess(user: user)
        }.catch { (err) in
            self.presenter?.didFail(err: err.localizedDescription)
        }
        
        
        
    }

}
