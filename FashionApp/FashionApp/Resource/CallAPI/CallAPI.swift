//
//  CallAPI.swift
//  FashionApp
//
//  Created by Apple on 4/18/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Alamofire

enum NetworkError: Error {
    case urlError
    case otherError(msg: String)
    var message: String {
        switch self {
        case .urlError:
            return "Errer is cause url"
        case .otherError(let msg):
            return msg
        }
    }
}

class APICaller {
    
    //MARK: Alamofire
//    static func getAPI<T: Codable>(url: URL, _: T.Type ,handler: @escaping (T?, Error?) -> Void) {
//        Alamofire.request(url).responseJSON { (response) in
//            do {
//                let json = try JSONDecoder().decode(T.self, from: response.data!)
//                handler(json, nil)
//            } catch {
//                if let err = response.error {
//                    handler(nil, err)
//                }
//            }
//        }
//    }
    
    //MARK: Manual
    static func getMethod<T: Codable>(url: String, param: [String: Any]?, header: [String: String]?, T: T.Type, completion: @escaping (T?, NetworkError?) -> Void) {
        // Config url for get constain param
        guard let url = URL(string: url) else {completion(nil, .urlError); return}
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = param?.map {
            URLQueryItem(name: $0.key, value: String(describing: $0.value))
        }
        urlComponent?.queryItems = queryItems
        guard let mainUrl = urlComponent?.url else {completion(nil, .urlError); return}
//         Create request
        var request = URLRequest(url: mainUrl)
        request.allHTTPHeaderFields = header
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        callAPI(request: request, T: T, completion: completion)
    }
    
    static func otherMethod<T: Codable>(url: String, method: String, header: [String: String]?, param: [String: Any]?, T: T.Type, completion: @escaping (T?, NetworkError?) -> Void ) {
        guard let url = URL(string: url) else {completion(nil, .urlError); return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = method
        request.httpBody = try? JSONSerialization.data(withJSONObject: param as Any, options: .prettyPrinted)
        callAPI(request: request, T: T, completion: completion)
    }
    
    static func callAPI<T: Codable>(request: URLRequest, T: T.Type , completion: @escaping (T?, NetworkError?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, _, err) in
            guard let data = data else {return}
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(json, nil)
            }catch {
                if err != nil {
                    completion(nil, .otherError(msg: err!.localizedDescription))
                }
            }
        }
        task.resume()
    }
}



