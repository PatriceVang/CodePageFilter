//
//  ListUserReducer.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift


func listUserReducer(action: Action, state: ListUserState?) -> ListUserState {
    var state = state ?? ListUserState()
    
    switch action {
    case let action as ListUserState.Read:
        state.listUser = action.user
    case let action as ListUserState.Delete:
        state.listUser.remove(at: action.index)
    case let action as ListUserState.Update:
        for i in 0..<state.listUser.count {
            if state.listUser[i].id == action.user.id {
                state.listUser[i] = action.user
            }
        }
    case let action as ListUserState.Add:
        state.listUser.append(action.user)

    default:
        break
    }
    return state
}

