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




