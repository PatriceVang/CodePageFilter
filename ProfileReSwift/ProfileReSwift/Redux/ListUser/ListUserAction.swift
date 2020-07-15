//
//  ListUserAction.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift

extension ListUserState {
    struct Read: Action  {
        var user: [User]
    }

    struct Update: Action {
        var user: User
    }

    struct Delete: Action {
        var index: Int
    }
    struct Add: Action {
        var user: User
    }
    
    
}




