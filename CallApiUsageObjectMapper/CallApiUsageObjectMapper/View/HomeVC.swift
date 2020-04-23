//
//  HomeVC.swift
//  CallApiUsageObjectMapper
//
//  Created by Apple on 4/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import ObjectMapper


typealias JSON = [String: Any]
class HomeVC: UIViewController {
    var listUser = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
     
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
            
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = nil
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, _, err) in
            guard let data = data else {return}
            do {
                guard let object = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [JSON] else {return}
                for item in object {
                    guard let user = User(JSON: item) else {return}
                    print(user.address)
                    self.listUser.append(user)
                }
                print(self.listUser.count)
            }catch {
                if let error = err {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
        

}
