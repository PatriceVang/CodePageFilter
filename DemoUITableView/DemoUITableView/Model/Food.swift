//
//  Food.swift
//  DemoUITableView
//
//  Created by Apple on 3/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class Food {
    var name: String
    var img: String
    var image : UIImage?
    var rating: Int
    var descrition: String
    init(name: String, img: String, rating: Int, descrition: String) {
        self.name = name
        self.img = img
        self.rating = rating
        self.descrition = descrition
    }
}
