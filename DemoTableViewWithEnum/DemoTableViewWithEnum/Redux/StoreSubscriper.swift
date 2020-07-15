//
//  StoreListenner.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/9/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift



class SubStateSubcripber<T>: StoreSubscriber {
    
    typealias CallbackFuntion = (T) -> Void
    typealias StoreSubscriberStateType  = T
    
    private var handler: CallbackFuntion?
    
    
    init(handler: CallbackFuntion?) {
        self.handler = handler
    }
    
    func newState(state: StoreSubscriberStateType) {
        self.handler?(state)
    }
}
