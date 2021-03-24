//
//  MainTabbarViewController.swift
//  RadiusTabbar
//
//  Created by Apple on 3/11/21.
//  Copyright © 2021 vinova. All rights reserved.
//

import Foundation
import UIKit

class MainTabbarViewController: UITabBarController {
    
    private let itemsUnselect = [UIImage(named: "home_unselect")!, UIImage(named: "resource_unselect")!, UIImage(named: "scan_unselect")!, UIImage(named: "note_unselect")!]
    
    private let itemsSelect = [UIImage(named: "home_select")!, UIImage(named: "resource_select")!, UIImage(named: "note_select")!, UIImage(named: "note_select")!]
    
    private let listTitle = ["Home", "Resources", "Scan", "Note"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        viewControllers = createViewController([FirstViewController(), SecondViewController(), ThirdViewController(), FourViewController()])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let path = UIBezierPath(roundedRect: tabBar.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 16, height: 16))
        let line = CAShapeLayer()
        line.path = path.cgPath
        
        line.fillColor = UIColor.white.cgColor
        line.shadowColor = UIColor.gray.cgColor
        line.shadowOpacity = 0.3
        line.shadowRadius = 6
        line.shadowOffset = .init(width: 0, height: -2)
        tabBar.layer.insertSublayer(line, at: 0)
        
        let appearance = tabBar.standardAppearance
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        tabBar.standardAppearance = appearance

    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let currentIndex = tabBar.items?.firstIndex(of: item) else {return}
        guard let items = tabBar.items else {return}
        for i in 0..<items.count {
            tabBar.items?[i].image = itemsUnselect[i]
        }
        
        item.image = itemsSelect[currentIndex]
    }
    
    private func createViewController(_ viewControlers: [UIViewController]) -> [UIViewController] {
        var nvVC = [UINavigationController]()
        for i in 0..<viewControlers.count {
            viewControlers[i].tabBarItem = .init(title: "", image: i == 0 ? UIImage(named: "home_select")! : itemsUnselect[i], tag: i)
            let nv = UINavigationController()
            nv.viewControllers = [viewControlers[i]]
            nvVC.append(nv)
        }
        return nvVC
    }
}
