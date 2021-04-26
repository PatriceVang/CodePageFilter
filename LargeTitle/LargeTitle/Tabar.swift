//
//  Tabar.swift
//  LargeTitle
//
//  Created by Apple on 4/23/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import UIKit


enum TabbarItemType: Int {
    case Home = 0
    case Resources
 
    
    static let itemTitle = ["Home", "Resources"]
 
}

class MainTabbarViewController: UITabBarController {
    
    private let listVC = [ViewController(), ResourceVC()]
    
    var indexItem = TabbarItemType.Home.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        selectViewController()

    }
    
    func selectViewController() {
        let vc = self.viewControllers
        self.selectedViewController = vc?[indexItem]
        tabBar(tabBar, didSelect: (tabBar.items?[indexItem])!)
    }
    
    private func setupUI() {
        viewControllers = createViewController()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        customRadiusTabbar()
    }
    
    private func customRadiusTabbar() {
        let path = UIBezierPath(roundedRect: tabBar.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 16, height: 16))
        let line = CAShapeLayer()
        line.path = path.cgPath
        line.fillColor = UIColor.white.cgColor
        line.shadowColor = UIColor.gray.cgColor
        line.shadowOpacity = 0.3
        line.shadowRadius = 6
        line.shadowOffset = .init(width: 0, height: -2)
        line.backgroundColor = UIColor.white.cgColor
        tabBar.layer.insertSublayer(line, at: 0)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let currentIndex = tabBar.items?.firstIndex(of: item), let items = tabBar.items else {return}
//        for i in 0..<items.count {
//            tabBar.items?[i].title = ""
//            tabBar.items?[i].image = TabbarItemType.itemUnselect[i]
//        }
        // Tap on scan item
//        if currentIndex == 2 {
//            let vc = factory.makeQRScanerVC()
//            vc.tabBarItemIndex = indexItem
//            let nv = UINavigationController(rootViewController: vc)
//            nv.hidesBottomBarWhenPushed = true
//            presentFullScreen(nv, animated: false, completion: nil)
//        } else {
//            item.image = TabbarItemType.itemSelected[currentIndex]
//            item.title = TabbarItemType.itemTitle[currentIndex]
//            indexItem = currentIndex
//        }
    
    }
    
    private func createViewController() -> [UIViewController] {
        var vc = [UIViewController]()
        for i in 0..<listVC.count {
            listVC[i].tabBarItem = .init(title: TabbarItemType.itemTitle[i], image: nil, tag: i)
            let nv = UINavigationController(rootViewController: listVC[i])
            vc.append(nv)
        }
        return vc
    }
}

