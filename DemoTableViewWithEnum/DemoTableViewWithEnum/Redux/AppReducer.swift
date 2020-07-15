//
//  AppReducer.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/9/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift


func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(peopleState: peopleReducer(action: action, state: state?.peopleState))
}
