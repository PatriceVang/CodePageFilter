//: [Previous](@previous)

import Foundation

//var str = "Hello, playground"

//: [Next](@next)


@propertyWrapper
struct Named {
    var value: String

    var wrappedValue: String {
        get {
            return value
        }
        
        set {
            value = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }

}

struct Strim {
    @Named(value: "Nam") var name: String
}

var name = Strim()
name.name


@propertyWrapper
struct Default<T> {

    var key: String
    internal var storage: UserDefaults = .standard
    
    var wrappedValue: T {
        get {
            (storage.value(forKey: key) as! T)
        }
        
        set {
            storage.set(newValue, forKey: key)
        }
    }
}

struct Persitent {
    static var shared = Persitent()
    @Default<Int>(key: "int") var tinhToan
    @Default<String>(key: "string") var chuoi
}

Persitent.shared.tinhToan = 10
print(Persitent.shared.tinhToan)


