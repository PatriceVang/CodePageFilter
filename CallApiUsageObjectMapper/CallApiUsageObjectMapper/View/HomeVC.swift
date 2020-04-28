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
   

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let url = "https://jsonplaceholder.typicode.com/users"
        APICaller.getMethodOther(url: url, header: nil, param: nil) { (data, err) in
            guard let data = data else {return}
            do {
                let object = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [JSON]
                let users = Mapper<User>().mapArray(JSONArray: object!)
//                print(users.map {$0.address})
            }catch {
                print(err?.message)
            }
        }
            
//        var request = URLRequest(url: url)
//        request.allHTTPHeaderFields = nil
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "GET"
//        let task = URLSession.shared.dataTask(with: request) { (data, _, err) in
//            guard let data = data else {return}
//            do {
//                guard let object = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [JSON] else {return}
//                for item in object {
//                    guard let user = User(JSON: item) else {return}
//                    print(user.address)
//                    self.listUser.append(user)
//                }
//                print(self.listUser.count)
//            }catch {
//                if let error = err {
//                    print(error.localizedDescription)
//                }
//            }
//        }
//        task.resume()
    }
    
    @IBAction func onMoveDetailVC(_ sender: Any) {
        let nib = DetailVC(nibName: "DetailVC", bundle: nil)
        self.navigationController?.pushViewController(nib, animated: true)
    }
        

}
