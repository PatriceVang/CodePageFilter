//
//  APIService.swift
//  NetworkingCombine
//
//  Created by Apple on 5/14/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import Combine



class APIService {
    
//    let apiRequest: APIRequestProtocol
//    init(apiRequest: APIRequestProtocol) {
//        self.apiRequest = apiRequest
//    }
    init() {}
    
    func request<T: Codable>(_ endPoint: ApiEndpoint, _ : T.Type) -> Future<T, APIError> {
        return Future { promise in
            let success = URLSession.DataTaskPublisher(request: endPoint.urlRequest, session: .shared)
                .map(\.data)
                .receive(on: DispatchQueue.main)
                .decode(type: T.self, decoder: JSONDecoder())
                .sink(receiveCompletion: { result in
                    switch result {
                    case .failure(_):
                        promise(.failure(APIError.unknown))
                    case .finished:
                        print("finise")
                    }
                }) { (object) in
                    promise(.success(object))}
            success.cancel()
        }
    }
    
    
}
