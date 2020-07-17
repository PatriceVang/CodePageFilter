//
//  Extension.swift
//  ProfileReSwift
//
//  Created by Apple on 7/17/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation





enum BoolType {
    case no
    case ok
}

extension BoolType {
    mutating func swithType() {
        switch self {
        case .no:
            self = .ok
        case .ok:
            self = .no
        }
    }
    
    var currentValue: Bool {
        switch self {
        case .ok:
            return true
        case .no:
            return false
        }
    }
}
