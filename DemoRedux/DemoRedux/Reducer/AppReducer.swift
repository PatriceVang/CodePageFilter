//
//  AppReducer.swift
//  DemoRedux
//
//  Created by Apple on 7/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift


func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(homeState: homeReducer(action: action, state: state?.homeState), detailState: detailReducer(action: action, state: state?.detailState))
}


