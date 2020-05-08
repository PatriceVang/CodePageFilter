//
//  TapBarController.swift
//  FashionApp
//
//  Created by Apple on 4/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class TapBarController: UITabBarController {
    let userVC : UserController = {
        let sport = UserController()
        sport.tabBarItem = .init(title: "User", image: Resource.Image.imgPerson, tag: 1)
        return sport
    }()
    let cartVC : CartController = {
        let cart = CartController()
        cart.tabBarItem = .init(title: "Cart", image: Resource.Image.imgCart, tag: 2)
        return cart
    }()
    let utitilyVC : UtilityController = {
         let utitily = UtilityController()
        utitily.tabBarItem = .init(title: "Utility", image: Resource.Image.imgLine, tag: 3)
         return utitily
     }()
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = HomeController()
        self.tabBar.tintColor = Resource.Color.colorHeader
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: Resource.Image.imgHome, tag: 0)
        self.viewControllers = [UINavigationController(rootViewController: homeVC), userVC,  cartVC, utitilyVC]
    }
}
