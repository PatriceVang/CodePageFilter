//
//  ApiCaller.swift
//  CustomView
//
//  Created by Apple on 4/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
typealias JSON = [String: Any]
enum NetWorkError {
    case urlError
    case otherError(msg: String)
    
    var message: String {
        switch self {
        case .urlError:
            return "Error is cause url"
        case .otherError(let msg):
            return msg
        }
    }
}


class APICaller {
    static func otherMethod<T: Codable>(url: String, header: [String: String]?, param: JSON?, T: T.Type, completion: @escaping (T?, NetWorkError?) -> Void) {
        guard let url = URL(string: url) else {completion(nil, .urlError); return}
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param as Any, options: .prettyPrinted)
        callApi(request: request, T: T, completion: completion)
    }
    
    static func callApi<T: Codable>(request: URLRequest, T: T.Type, completion: @escaping (T?, NetWorkError?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, _, err) in
            guard let data = data else {return}
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(object, nil)
            }catch {
                if let error = err {
                    completion(nil, .otherError(msg: error.localizedDescription))
                }
            }
        }
        task.resume()
    }
}
