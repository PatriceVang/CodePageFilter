//
//  DetailState.swift
//  DemoRedux
//
//  Created by Apple on 7/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift


struct DetailState: StateType {
    var updateState: UpdateState = UpdateState()
}

struct UpdateState {
    var title: String = ""
}
