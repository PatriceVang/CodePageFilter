//
//  UserDefaultHelper.swift
//  FashionApp
//
//  Created by Apple on 5/5/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import UIKit

enum UserDefaultKey: String {
    case cart = "mycart"
    case email = "email"
    case userName = "name"
    case password = "password"
    case imageUser = "image"
}

class UserDefaultHelper {
    static var shared = UserDefaultHelper()
    var cart: [ModelCart]? {
        set {
            guard let data = newValue.toData else { return }
            saveObject(data, key: .cart)
        }
        get {
            let data = loadObject(type: Data.self, key: .cart)
            return data?.toObject(type: [ModelCart].self)
        }
    }
    var name: String? {
        set{
            guard let aName = newValue else {return}
            saveObject(aName, key: .userName)
        }
        get {
            let nameNew = loadObject(type: String.self, key: .userName)
            return nameNew
        }
    }
    var email: String? {
        set {
            guard let aEmail = newValue else {return}
            saveObject(aEmail, key: .email)
        }
        get {
            let newEmail = loadObject(type: String.self, key: .email)
            return newEmail
        }
    }
    var password: String? {
        set {
            guard let aPassword = newValue else {return}
            saveObject(aPassword, key: .password)
        }
        get {
            let newPassword = loadObject(type: String.self, key: .password)
            return newPassword
        }
    }
    var presentImg: Data? {
        set {
            guard let data = newValue else {return}
            saveObject(data, key: .imageUser)
        }
        get {
            let newData = loadObject(type: Data.self, key: .imageUser)
            return newData
        }
    }
    
    private func saveObject(_ object: Any, key: UserDefaultKey) {
        UserDefaults.standard.set(object, forKey: key.rawValue)
    }
    private func loadObject<T>(type: T.Type, key: UserDefaultKey) -> T? {
        return UserDefaults.standard.value(forKey: key.rawValue) as? T
    }
}

extension Encodable {
    var toData: Data? {
        return try? JSONEncoder().encode(self)
    }
}
extension Data {
    func toObject<T: Decodable>(type: T.Type) -> T? {
        return try? JSONDecoder().decode(type, from: self)
    }
}



