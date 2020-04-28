//
//  ApiCaller.swift
//  CallApiUsageObjectMapper
//
//  Created by Apple on 4/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ObjectMapper


enum NetworlError: Error {
    case urlError
    case otherError(msg: String)
    var message: String {
        switch self {
        case .urlError:
            return "Url had been Error"
        case .otherError(let msg):
            return msg
        }
    }
}

class APICaller {
    static func getMethod<T: Mappable>(url: String, header: [String: String]?, param: [String: Any]?, _: T.Type, completion: @escaping (T?, NetworlError?) -> Void) {
        guard let url = URL(string: url) else {completion(nil,.urlError); return}
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = param?.map {URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
        urlComponent?.queryItems = queryItems
        guard let mainUrl = urlComponent?.url else {return}
        var request = URLRequest(url: mainUrl)
        request.allHTTPHeaderFields = header
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        callApi(request: request, T.self, completion: completion)
        
    }
    
    static func callApi<T: Mappable>(request: URLRequest,_: T.Type, completion: @escaping (T?, NetworlError?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, _, err) in
            guard let data = data else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    let object = T(JSON: json as? [String: Any] ?? [:])
                    completion(object, nil)

            } catch {
                completion(nil, .otherError(msg: err!.localizedDescription))
            }
        }
        task.resume()
    }
    
    static func getMethodOther(url: String, header: [String: String]?, param: [String: Any]?, completion: @escaping (Data?, NetworlError?) -> Void) {
        guard let url = URL(string: url) else {completion(nil,.urlError); return}
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = param?.map {URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
        urlComponent?.queryItems = queryItems
        guard let mainUrl = urlComponent?.url else {return}
        var request = URLRequest(url: mainUrl)
        request.allHTTPHeaderFields = header
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        callApiOther(request: request, completion: completion)
        
        
    }
    static func callApiOther(request: URLRequest, completion: @escaping (Data?, NetworlError?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, _, err) in
            if err != nil {
                completion(nil, .otherError(msg: err!.localizedDescription))
            }
            completion(data, nil)
        }
        task.resume()
    }
    
}

