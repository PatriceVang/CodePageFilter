//
//  HomeVC.swift
//  NetworkingCombine
//
//  Created by Apple on 5/14/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Combine
class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let userService = UserService()

        let endpoint = UserEndpoint.getUser
        _ = URLSession.shared.dataTaskPublisher(for: endpoint.baseUrl)
            .map(\.data)
            .decode(type:[User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                print($0)
            }) { (user) in
                print(user)
        }
            
                      
    
                        

    }



}
