//
//  PeopleReducer.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/9/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift

func peopleReducer(action: Action, state: PeopleState?) -> PeopleState {
    var state = state ?? PeopleState()

    switch action {
    case let action as ShowPeople:
        for i in 0..<state.list.count {
            if state.list[i].id == action.number {
                state.list[i].isCollapsed = true
                state.list[i].items = action.list
            }
        }
    case let action as HidePeople:
        for i in 0..<state.list.count {
            if state.list[i].id == action.number {
                state.list[i].isCollapsed = false
                state.list[i].items = []
            }
        }
  
    default:
        break
    }
    
    return state

}
