//
//  UserDefaultHelper.swift
//  PropertyWrapber
//
//  Created by Apple on 3/25/21.
//  Copyright © 2021 vinova. All rights reserved.
//

import Foundation

@propertyWrapper
struct Default<T> {
    let key: String
    let storage: UserDefaults = .standard
    
    var wrappedValue: T? {
        get {
            storage.value(forKey: key) as? T
        }
        set {
            storage.set(newValue, forKey: key)
        }
    }
}

class UserDefaultHelper {
    static let shared = UserDefaultHelper()
    @Default<Int>(key: "number") var number
    
    private init() {}
}


