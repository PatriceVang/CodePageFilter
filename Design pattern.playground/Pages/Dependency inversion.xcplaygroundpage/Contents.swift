//: [Previous](@previous)

import Foundation

//class Order {
//    var name: String?
//    init(name: String?) {
//        self.name = name
//    }
//}
//


//protocol OrderStorage {
//    func saveOrder(order: Order)
//}
//
//
//class Handler {
//
//    let orderStorage: OrderStorage
//
//    init(orderStorage: OrderStorage) {
//        self.orderStorage = orderStorage
//    }
//
//    func saveOrder(order: Order) {
//        orderStorage.saveOrder(order: order)
//    }
//}
//
//
//class OrderDataBase: OrderStorage {
//    func saveOrder(order: Order) {
//        print("Save database" + order.name!)
//    }
//}

//class OrderApi: OrderStorage {
//    func saveOrder(order: Order) {
//        print("Save API" + order.name!)
//    }
//
//
//}
//let a = Handler(orderStorage: OrderDataBase())
//if a.orderStorage is OrderApi {
//    a.saveOrder(order: .init(name: "Salad"))
//} else {
//    a.saveOrder(order: .init(name: "Salad"))
//}
//var total = 0
//
//var number: Int = 10 {
//    willSet {
//        print("New value: \(newValue)")
//        total = number
//    }
//
//    didSet {
//        total = number
//    }
//}
//number = 11
//
//print(total)

//print(number)



protocol Drive {
    var speed: Int {get set}
    var color: String { get }
}

class Suv: Drive {
    var speed: Int  {
        get {
            return 0
        }
        
        set {
            speed = newValue
        }
    }
    var color: String {
        return "123123"
    }
//    init(speed: Int, color: String) {
//        self.speed = speed
//        self.color = color
//    }
}

//var a = Suv(speed: 100, color: "Red")
//a.color = "asdf"
//print(a.color)

//var a = Suv()
//a.speed = 100
//print(a.color)
//


//protocol Anonymous {
//    associatedtype T
//    
//    func total() -> T
//}
//
//class A: Anonymous {
//    func total() -> String {
//        
//    }
//    
//    typealias T = String
//    
//    
//    
//
//}
