//
//  APIService.swift
//  NetworkingCombine
//
//  Created by Apple on 5/14/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import Combine



protocol APIRequestProtocol {
    func request(_ endPoint: ApiEndpoint) -> AnyPublisher<Data, APIError>
}


struct APIRequest: APIRequestProtocol {
    func request(_ endPoint: ApiEndpoint) -> AnyPublisher<Data, APIError> {
        return URLSession.shared.dataTaskPublisher(for: endPoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError {_ in APIError.unknown}
            .flatMap { data, response -> AnyPublisher<Data, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                if (200...299).contains(response.statusCode) {
                    return Just(data)
                        .mapError {_ in APIError.unknown}
                    .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
        }
        .eraseToAnyPublisher()
        
        
    }
}
