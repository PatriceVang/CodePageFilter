//
//  HomeAction.swift
//  DemoRedux
//
//  Created by Apple on 7/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift



struct HomeAction: Action {
    var counterIncrease: CounterActionIncreaseAction?
    var counterDecrease: CounterActionDecreaseAction?
    var displayTitle: DisplayTitleAction?
}


struct CounterActionIncreaseAction: Action {}

struct CounterActionDecreaseAction: Action {}

struct DisplayTitleAction: Action {
    var text: String
}

struct AllowDisplayText: Action {
    var isAllowed: Bool
}
