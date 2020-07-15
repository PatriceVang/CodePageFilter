//
//  StoreSubcripber.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift


class StoreListener<T>: StoreSubscriber {
    typealias Listener = (T) -> Void
    typealias StoreSubscriberStateType = T
    private var handler: Listener?
    init(handler: Listener?) {
        self.handler = handler
    }
    
    func newState(state: StoreSubscriberStateType) {
        self.handler?(state)
    }
}

