//
//  PeopleAction.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/9/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift

struct ShowPeople: Action {
    var number: Int
    var list: [Any]
}

struct HidePeople: Action {
    var number: Int
}
