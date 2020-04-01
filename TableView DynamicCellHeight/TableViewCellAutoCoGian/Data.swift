//
//  Data.swift
//  TableViewCellAutoCoGian
//
//  Created by Apple on 3/31/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


class  Data {
    var a: String = {
        var a1 = "Ten horses: "
        for i in 0...9 {
            a1 += "horses "
        }
        return a1
    }()
    var b: String = {
        var b1 = "Three cows: "
        for i in 0...2 {
            b1 += "cows "
        }
        return b1
    }()
    var c: String = {
        var c1 = "One cames: came!"
        return c1
    }()
    var d : String = {
        var d1 = "Nighty - nine sheeps: "
        for i in 0...89 {
            d1 += "sheeps "
        }
        return d1
    }()
    
    var e : String = {
        var e1 = "Thirty goats: "
        for i in 0...29 {
            e1 += "goat "
        }
        return e1
    }()
   
    func data() -> [String] {
        var dataNew = [a,b,c,d,e]
        return dataNew
    }
}
