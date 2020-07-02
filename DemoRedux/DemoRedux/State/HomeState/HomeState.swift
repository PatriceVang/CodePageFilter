//
//  HomeState.swift
//  DemoRedux
//
//  Created by Apple on 7/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift


struct HomeState: StateType {
    var counter = 0
    var displayTitle: DisplayTitleState = DisplayTitleState()
    
}

struct DisplayTitleState {
    var name = "0"
}




