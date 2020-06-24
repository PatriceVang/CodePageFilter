//
//  APICaller.swift
//  MVVMOne
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Alamofire



enum NetworkError {
    
    case urlError
    case otherError(msg: String)
    
    var message: String {
        switch self {
        case .urlError:
            return "bad url"
        case .otherError(let msg):
            return msg
        }
    }
}


//class APICaller {
//
//    static let shared = APICaller()
//
//
//    func getMethod<T: Codable>(_ : T.Type ,url: String, header: [String: String]?, params: [String: Any]?, completion: @escaping (T?, NetworkError? ) -> Void )  {
//        guard let url = URL(string: url) else {return}
//        var urlComp = URLComponents(url: url, resolvingAgainstBaseURL: true)
//        let queryItem = params?.map { URLQueryItem(name: $0.key, value: String(describing: $0.value))}
//        urlComp?.queryItems = queryItem
//
//        guard let mainUrl = urlComp?.url else {
//            completion(nil, .urlError); return
//        }
//
//        var request = URLRequest(url: mainUrl)
//        request.allHTTPHeaderFields = header
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "GET"
//        callApi(T.self, request: request, completion: completion)
//
//    }
//
//    func callApi<T: Codable>(_: T.Type ,request: URLRequest, completion: @escaping (T?, NetworkError?) -> Void) {
//        let task = URLSession.shared.dataTask(with: request) { (data, _, err) in
//            guard let data = data else {return}
//            if err != nil {
//                completion(nil, .otherError(msg: err!.localizedDescription))
//            } else {
//                let resultJson = try? JSONDecoder().decode(T.self, from: data)
//                completion(resultJson, nil)
//            }
//        }
//        task.resume()
//    }
//}

class APIService {
    static let shared = APIService()
    
    
    func getMethodByAl<T: Codable>(of: T.Type, url: String, params:[String: Any]?, header: HTTPHeaders? ,completion: @escaping (T?, AFError?) -> Void) {
        
        AF.request(url, method: .get, parameters: params, headers: header)
        .validate()
        .responseDecodable(of: T.self) { (response) in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let err):
                completion(nil, err)
            }
        }
    }
}
