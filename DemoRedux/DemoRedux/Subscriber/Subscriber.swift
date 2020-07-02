//
//  Subscriber.swift
//  DemoRedux
//
//  Created by Apple on 7/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift

public class Subcriber<T>: StoreSubscriber {
    public typealias Listener = (T) -> Void

    private let block: Listener?
    
    public init(block: Listener?) {
        self.block = block
    }
    
    public func newState(state: T) {
        self.block?(state)
    }
    
    
}

