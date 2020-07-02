//
//  DetailReducer.swift
//  DemoRedux
//
//  Created by Apple on 7/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift


func detailReducer(action: Action, state: DetailState?) -> DetailState {
    var state = state ?? DetailState()
    switch action {
    case let action as UpdateTitleAction:
        state.updateState.title = action.title!
    default:
        break
    }
    return state
}

