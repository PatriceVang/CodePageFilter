//
//  Service.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 10/27/21.
//

import Foundation
import Alamofire
import Combine


class ApiService {
    func request<T: Codable>(apiRequest: ApiRequest) -> Future<T, ApiError>  {
        return Future() { promise in
            AF.request(
                BaseUrl.host + apiRequest.path,
                method: apiRequest.httpMethod,
                parameters: apiRequest.parameters,
                encoding: apiRequest.httpMethod == HTTPMethod.get ? URLEncoding.default : JSONEncoding.default,
                headers: Header.json_application).responseData { (response) in
                if response.error == nil {
                    do {
                        let response = try JSONDecoder().decode(ApiResponse<T>.self, from: response.data!)
                        
                        if let error = response.error {
                            promise(.failure(error))
                            return
                        }
    
                        promise(.success(response.result!))
                        
                    } catch (let error) {
                        promise(.failure(ApiError(message: error.localizedDescription)))
                    }
                } else {
                    promise(.failure(ApiError(message: response.error?.localizedDescription)))
                }
            }
        }
    }
}
