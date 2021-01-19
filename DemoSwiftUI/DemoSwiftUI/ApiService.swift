//
//  File.swift
//  DemoSwiftUI
//
//  Created by Apple on 11/16/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Combine

class ApiService {
    static let share = ApiService()
    
    
    func getUser() -> AnyPublisher<[User], Error> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map({ (server)  in
                server.data
            })
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
