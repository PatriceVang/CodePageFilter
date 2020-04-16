//
//  APICaller.swift
//  SampleMVP
//
//  Created by phthphat on 4/15/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import Foundation

protocol Networking {
    func makeRequest<Model: Codable>(_ responseType: Model.Type, endPoint: Endpoint, resultHandle: @escaping (Result<Model?, NetworkError>) -> Void)
}

extension Networking {
    func makeRequest<Model: Codable>(_ responseType: Model.Type, endPoint: Endpoint, resultHandle: @escaping (Result<Model?, NetworkError>) -> Void) {
        //Handle bad url
        guard var url = URLComponents(url: URL(string: endPoint.url)!, resolvingAgainstBaseURL: true) else {
            resultHandle(.failure(.badUrl))
            return
        }
        
        var request: URLRequest?
        //Set up param
        switch endPoint.method {
        case .get:
            let queryItems = endPoint.param?
                .map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
            url.queryItems = queryItems
            
            request = URLRequest(url: url.url!)
        default:
            let data = try? JSONSerialization.data(withJSONObject: endPoint.param as Any, options: .prettyPrinted)
            request = URLRequest(url: url.url!)
            request?.httpBody = data
        }
        
        //Set up header
        request?.allHTTPHeaderFields = endPoint.header
        request?.addValue("Application/json", forHTTPHeaderField: "Content-type")
        
        //Call API
        URLSession.shared.dataTask(with: request!) { (data, _, err) in
            if let error = err {
                resultHandle(.failure(.networkError(msg: error.localizedDescription)))
                return
            }
            guard let data = data else { return }
            
            let model = try? JSONDecoder().decode(Model.self, from: data)
            resultHandle(.success(model))
        }.resume()
    }
}

struct Endpoint {
    var url: String
    var method: NetworkMethod
    var param: [String: Any]?
    var header: [String: String]?
}

enum NetworkMethod {
    case get, post
}

enum NetworkError: Error {
    case badUrl
    case networkError(msg: String)
    case other(msg: String)
    
    var message: String {
        switch self {
        case .badUrl:
            return "Bad url"
        case .other(let msg), .networkError(let msg):
            return msg
        }
    }
}
