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
    case let action as ListUserState.Filter:
        state.listUser = action.newListUser
    case _ as ListUserState.ShowSelecteItems:
        state.isShowSelecteItems = !state.isShowSelecteItems
        
        for i in 0..<state.listUser.count {
            state.listUser[i].isSelected = false
        }
    case let action as ListUserState.IsSelectedItems:

        state.listUser[action.userIndex].isSelected = !state.listUser[action.userIndex].isSelected!
        
        if state.listUser[action.userIndex].isSelected! {
            state.selectedUser.append(state.listUser[action.userIndex])
        } else {
            state.selectedUser = state.selectedUser.filter({ (user) -> Bool in
                return user.id != state.listUser[action.userIndex].id
            })
        }
        
        print(state.selectedUser)
    case _ as ListUserState.IsDeletedItems:
        for item in state.selectedUser {
            state.listUser.removeAll {
                $0.id == item.id
            }
        }
        state.selectedUser = []

    default:
        break
    }
    return state
}
    
