//
//  TimerCounter.swift
//  DemoSwiftUI
//
//  Created by Apple on 10/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Combine

class TimerCounter: ObservableObject {
    var timer: Timer?
    @Published var counter = 0
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {[weak self] (timer) in
            self?.counter += 1
        })
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
}
