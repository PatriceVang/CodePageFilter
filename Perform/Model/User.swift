//
//  User.swift
//  Perform
//
//  Created by Apple on 3/30/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation

class User {
    var name : String
    var isChecked : Bool
    init(name: String, isChecked: Bool) {
        self.name = name
        self.isChecked = isChecked
    }
    
    func update(isChecked: Bool) {
        self.isChecked = isChecked
    }
}
