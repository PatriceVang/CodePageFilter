//
//  Service.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 10/27/21.
//

import Foundation
import Combine




class Service {
    var cancellableSet: Set<AnyCancellable> = []
    
    func request<T: Decodable>(endpoint: EndointType, type: T.Type) -> Future<T, Error> {
        
        var request = URLRequest(url: URL(string: endpoint.baseUrl.appending(endpoint.url))!)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = convertToData(body: endpoint.body)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]

        return Future { promise in
            URLSession.shared.dataTaskPublisher(for: request)
                .subscribe(on: DispatchQueue.global(qos: .background))
                .tryMap { data, response in
                    guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                        throw URLError(URLError.badServerResponse)
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { (completion) in
                    print(completion)
                    switch completion {
                    case .failure(let error):
                        promise(.failure(error))
                    case .finished:
                        break
                    }
                } receiveValue: { (model) in
                    print(model)
                    promise(.success(model))
                }.store(in: &self.cancellableSet)
        }
    }
    
    private func convertToData(body: [String: Any]) -> Data? {
        if body.isEmpty { return nil}
        let data = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        return data
    }
}
