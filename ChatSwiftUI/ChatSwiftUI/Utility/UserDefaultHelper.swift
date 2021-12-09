//
//  UserDefaultHelper.swift
//  ChatSwiftUI
//
//  Created by Apple on 12/1/21.
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
    @Default<String>(key: "uid") var uid
    @Default<Bool>(key: "isLogedIn") var isLogedIn

    private init() {}
}
