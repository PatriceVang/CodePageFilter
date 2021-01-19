//: [Previous](@previous)

import Foundation

//var str = "Hello, playground"

//: [Next](@next)

class Animals {
    var name: String?
    
    init?(name: String?) {
        self.name = name
    }
    
    deinit {
        print("de init \(name ?? "")")
    }
}

class Lion: Animals {
    
    var animal: Lion?

}

var a = Animals(name: "Lion")
//var b = Animals(name: "Li")
//var c = b
var c = Lion(name: "Cop trai")
var d = Lion(name: "Cop cai")
d?.animal = c
//c?.animal = d
//c = nil
//d = nil




//var arr = [a, b, c]
//a = nil
//b = nil
//c = nil
//a = nil
//b = nil
//c = nil
//arr = []





