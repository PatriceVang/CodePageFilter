//
//  APICaller.swift
//  Almofire
//
//  Created by Apple on 6/4/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire



class APICaller {
    static let shared = APICaller()
    
    func getMethod<T: Codable>(of: T.Type, url: String, completion: @escaping (T?, AFError?) -> Void) {
        
        AF.request(url, method: .get, headers: nil ).responseDecodable(of: T.self) { (response) in
            guard let data = response.value else {return}
            switch response.result {
            case .success:
                completion(data, nil)
            case .failure(let err):
                completion(nil, err)
            }
        }
        
        let header: HTTPHeaders? = [
            
        ]
        
        AF.request(url, headers: header ).response { respone in
            print(respone)
        }
        
    }
}

