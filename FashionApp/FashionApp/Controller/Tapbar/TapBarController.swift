//
//  TapBarController.swift
//  FashionApp
//
//  Created by Apple on 4/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class TapBarController: UITabBarController {
    lazy var arrLine: [UIView] = {
        let arr = [UIView]()
        return arr
    }()
    let lineHome: UIView = {
       let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    let lineUser: UIView = {
          let line = UIView()
           line.translatesAutoresizingMaskIntoConstraints = false
           return line
       }()
    let lineCart: UIView = {
          let line = UIView()
           line.translatesAutoresizingMaskIntoConstraints = false
           return line
       }()
    let lineUtity: UIView = {
          let line = UIView()
           line.translatesAutoresizingMaskIntoConstraints = false
           return line
       }()
    let userVC : UserController = {
        let sport = UserController()
        sport.tabBarItem = .init(title: "User", image: Resource.Image.imgPerson, tag: 1)
        return sport
    }()
    let cartVC : CartController = {
        let cart = CartController()
        cart.tabBarItem = .init(title: "Cart", image: Resource.Image.imgCart, tag: 2)
        cart.tabBarItem.badgeColor = Resource.Color.colorTapbar
        cart.tabBarItem.badgeValue = ""
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

        
        self.viewControllers = [UINavigationController(rootViewController: homeVC), userVC, cartVC, utitilyVC]
        customElement()
        arrLine[0].backgroundColor = Resource.Color.colorHeader
    }
 
    //MARK: Custom element
    private func customElement() {
        self.view.addSubview(lineHome)
        lineHome.heightAnchor.constraint(equalToConstant: 2).isActive = true
        lineHome.widthAnchor.constraint(equalToConstant: view.frame.width / 4).isActive = true
        lineHome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        lineHome.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0).isActive = true
        self.view.addSubview(lineUser)
        lineUser.heightAnchor.constraint(equalToConstant: 2).isActive = true
        lineUser.widthAnchor.constraint(equalToConstant: view.frame.width / 4).isActive = true
        lineUser.leadingAnchor.constraint(equalTo: lineHome.trailingAnchor, constant: 0).isActive = true
        lineUser.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0).isActive = true
        self.view.addSubview(lineCart)
        lineCart.heightAnchor.constraint(equalToConstant: 2).isActive = true
        lineCart.widthAnchor.constraint(equalToConstant: view.frame.width / 4).isActive = true
        lineCart.leadingAnchor.constraint(equalTo: lineUser.trailingAnchor, constant: 0).isActive = true
        lineCart.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0).isActive = true
        self.view.addSubview(lineUtity)
        lineUtity.heightAnchor.constraint(equalToConstant: 2).isActive = true
        lineUtity.widthAnchor.constraint(equalToConstant: view.frame.width / 4).isActive = true
        lineUtity.leadingAnchor.constraint(equalTo: lineCart.trailingAnchor, constant: 0).isActive = true
        lineUtity.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0).isActive = true
        arrLine.append(lineHome)
        arrLine.append(lineUser)
        arrLine.append(lineCart)
        arrLine.append(lineUtity)
    }
    //MARK: Hanlde tap
     override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
         guard let index = tabBar.items?.firstIndex(of: item) else {return}
         for i in 0..<arrLine.count {
             arrLine[i].backgroundColor = i == index ? Resource.Color.colorHeader : .white
         }
     }
}


