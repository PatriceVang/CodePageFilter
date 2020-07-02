//
//  HomeReducer.swift
//  DemoRedux
//
//  Created by Apple on 7/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift


func homeReducer(action: Action, state: HomeState?) -> HomeState {
    var state = state ?? HomeState()
    switch action {
    case _ as CounterActionIncreaseAction:
        state.counter += 1
    case _ as CounterActionDecreaseAction:
        state.counter -= 1
    case let action as DisplayTitleAction:
        state.displayTitle.name = action.text
    default:
        break
    }
    
    return state
}
