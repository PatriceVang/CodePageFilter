//
//  ApiCaller.swift
//  DemoMVC
//
//  Created by Apple on 5/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation

enum NetworkError {
    case urlError
    case otherError(msg: String)
    var message: String {
        switch self {
        case .urlError:
            return "Bad url"
        case .otherError(let msg):
            return msg
        }
    }
}


class ApiCaller {
    
    
    static func getMethod(url: String, header: [String: String]?, params: [String: Any]?, completion: @escaping (Data?, NetworkError?) -> Void) {
        guard let url = URL(string: url) else {return}
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItem = params?.map { URLQueryItem(name: $0.key, value: String(describing: $0.value))}
        urlComponent?.queryItems = queryItem
        guard let mainUrl = urlComponent?.url else {completion(nil, .urlError); return}
        var request = URLRequest(url: mainUrl)
        request.allHTTPHeaderFields = header
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        callApi(request: request, completion: completion)
    }
    
    static func callApi(request: URLRequest, completion: @escaping (Data?, NetworkError?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, _, err) in
            guard let data = data else {return}
            
            if err != nil {
                completion(nil, .otherError(msg: err!.localizedDescription))
            }
            completion(data, nil)
            
        }
        task.resume()
    }
}
