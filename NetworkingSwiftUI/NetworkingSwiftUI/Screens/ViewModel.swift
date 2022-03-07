//
//  ViewModel.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/2/22.
//

import Foundation
import Combine


class ViewModel: ObservableObject {
    private var cancelable = Set<AnyCancellable>([])
    
    init() {
        //        let a = ReviewService(service: ApiService())
        //        a.getRatingDetai(productId: "3fa85f64-5717-4562-b3fc-2c963f66afa6").sink {
        //            switch $0 {
        //            case .failure(let error):
        //                print(error.message as Any)
        //            case .finished: break
        //            }
        //        } receiveValue: { (value) in
        //            print(value)
        //        }.store(in: &cancelable)
        
        
        let b = HomeService(service: ApiService())
        b.getLayoutHome().sink {
            switch $0 {
            case .failure(let error):
                print(error.message as Any)
            case .finished: break
            }
        } receiveValue: { (value) in
            print(value.justForYouList.title)
        }.store(in: &cancelable)
        
    }
}
