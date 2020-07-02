//
//  Product.swift
//  DemoRedux
//
//  Created by Apple on 6/30/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


class Product {
    var id: String
    var name: String
    var price: Double
    init(id: String, name: String, price: Double) {
        self.id = id
        self.name = name
        self.price = price
    }
    
    convenience init(){
        self.init(id: "", name: "", price: 0.0)
    }
}
