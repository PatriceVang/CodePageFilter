//
//  APICaller.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/16/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation

enum NetworkEror {
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


class APICaller {
    static func getMethod(url: String, header:[String: String]?, params: [String: Any]?, completion: @escaping (Data?, NetworkEror?) -> Void) {
        guard let url = URL(string: url) else {completion(nil, .urlError); return}
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let listQueryItems = params?.map({ (key: String, value: Any) in
            URLQueryItem(name: key , value: String(describing: value))
        })
        urlComponent?.queryItems = listQueryItems
        guard let mainUrl = urlComponent?.url else {return}
        var request = URLRequest(url: mainUrl)
        request.allHTTPHeaderFields = header
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        callApi(request: request, completion: completion)
        
    }
    static func callApi(request: URLRequest, completion: @escaping(Data?, NetworkEror?) -> Void) {
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, _, error) in
            DispatchQueue.global(qos: .utility).async {
                if error != nil {
                   completion(nil, .otherError(msg: error!.localizedDescription))
                }
                completion(data, nil)
            }
        })
        
        task.resume()
        
    }
    
    
}
