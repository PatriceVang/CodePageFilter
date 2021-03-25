//
//  NumberCondition.swift
//  PropertyWrapber
//
//  Created by Apple on 3/25/21.
//  Copyright © 2021 vinova. All rights reserved.
//

import Foundation

@propertyWrapper
struct Number {
    private var value: Int
    
    var wrappedValue: Int {
        get {
            if value % 2 == 0 {
                print("So chan")
                return value
            } else {
                return value + 1
            }
        }
        set {
            value = newValue
        }
    }
    init(value: Int) {
        self.value = value
    }
    
}

struct NumberCondition {
    @Number var value: Int
}



