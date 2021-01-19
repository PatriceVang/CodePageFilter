//: [Previous](@previous)

import Foundation





protocol SortBy {
    func sortByName()
    func sortByDate()
}

class Sorting: SortBy {

    private let products: [Product]
    init(product: [Product]) {
        self.products = product
    }
    func sortByName() {
        print("Name")
    }
    
    func sortByDate() {
        print("Date")
    }
}

class Product {
    var name: String
    var id: Int
    var quantity: Int
    
    init(id: Int, name: String, quantity: Int) {
        self.id = id
        self.name = name
        self.quantity = quantity
    }
}

class Store {
    var products: [Product]
    init(products: [Product]) {
        self.products = products
    }
    
    func sort() {
        
    }
}



var giay = Product(id: 1, name: "Giay", quantity: 10)
var ao = Product(id: 2, name: "Ao", quantity: 8)
var quan = Product(id: 3, name: "Quan", quantity: 4)


var store = Store(products: [giay, ao, quan])


