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
        let a = ReviewService()
        a.createRating(userId: "3fa85f64-5717-4562-b3fc-2c963f66afa6", productId: "3fa85f64-5717-4562-b3fc-2c963f66afa").sink { print($0)
        } receiveValue: { (value) in
            
        }.store(in: &cancelable)
    }
}
