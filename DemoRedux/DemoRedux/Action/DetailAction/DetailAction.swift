//
//  DetailAction.swift
//  DemoRedux
//
//  Created by Apple on 7/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift


struct DetailAction: Action {
    var updateTitleAction: UpdateTitleAction?
}

struct UpdateTitleAction: Action {
    var title: String?
}
