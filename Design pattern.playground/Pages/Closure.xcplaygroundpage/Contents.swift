//: [Previous](@previous)

import Foundation

//var str = "Hello, playground"
//print(str)

//: [Next](@next)
//var newFunc: (Int, Int) -> Int
//
//func num(numa: Int, numb: Int) -> Int {
//    return numa + numb
//}

//newFunc = num

//newFunc = { a, b in
//    return a + b
//}
//
//var printResult: () -> Void
//
//printResult = {
//    print("Da cos ket qua")
//}


//let resutl = newFunc(5,2)
//print(resutl)

//func printTheResultOfOperation(function: (Int, Int) -> Int, numa: Int, numb: Int, print: () -> Void) -> Int {
//    let resultValue = function(numa, numb)
//    print()
//    return resultValue
//}
//
//let a = printTheResultOfOperation(function: newFunc, numa: 5, numb: 5, print: printResult )
//print(a)


//var number = 6
//
//let closure = {
//    number += 2
//}
//
//closure()
//
//
//print(number)


//func num() -> (() -> Int) {
//
//    var number = 1
//
//    let sumClosure: () -> Int  = {
//        number += 10
//        print(number)
//        return number
//    }
//
//    return sumClosure
//}
//
//let resulta = num()
//
//resulta()
//resulta()
//
//let resultb = resulta
//resultb()

//var dic = ["1": 10, "2": 20]
//
//print(dic.keys)
//
//dic.updateValue(2, forKey: "2")
//
//struct A {
//
//    var number = 1
//    mutating func totla() {
//        number += 10
//        print("tota")
//    }
//}

//class A {
//    var id = 1
//}
//
//class B {
//    var id = 2
//}
//
//var a = A()
//var b = B()
//
//var c = b
//var d = b
//var e = c
//
//
//c.id = 10
//d.id = 20
//e.id = 30
//c = d
//d.id = 40

//print(e.id)

//class Animals {
//    var name: String?
//
//    func canfly() {
//        print("Can fly")
//    }
//    init(name: String) {
//        self.name = name
//    }
//}

//class Lion {
//    var canEat: Bool = true
//    var aninals: Animals
//
//    init(canEat: Bool, animal: Animals) {
//        self.canEat = canEat
//        self.aninals = animal
////        super.init(name: "Lion")
//    }
    
//    override func canfly() {
//        super.canfly()
//
//
//    }
//}

//var a = Animals(name: "Animals")
//var lion = Lion(canEat: true, animal: a)
//lion.aninals.name = "Chage"
//a.name
//lion.canfly()


/*
class Computer {
    var name: String?
    required init(name: String?) {
        self.name = name
    }
}


class Mobile: Computer {
    var sensor: Bool
    

    init(sensor: Bool) {
        self.sensor = sensor
        super.init(name: "iPhone7")
    }

    required init(name: String?) {
        self.sensor = true
        super.init(name: name)
        
    }
    
    func tinhTien() {
        
        let total = 0
        
        var compu: Int {
            if sensor {
                return total + 10
            } else {
                return total + 5
            }
        }
        
     
        
        print(compu)


    }
}

//var com = Computer(name: "Window")
var mob = Mobile(name: nil)
//com.name
mob.name
mob.sensor
*/
var a = 10

var computed: Int {
    get {
        return a
    }
    
    set {
        a = newValue
    }
}


