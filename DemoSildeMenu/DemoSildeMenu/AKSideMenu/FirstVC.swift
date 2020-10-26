//
//  FirstVC.swift
//  DemoSildeMenu
//
//  Created by Apple on 10/14/20.
//

import UIKit
import AKSideMenu

class FirstVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(presentLeftMenuViewController(_:)))
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.view.backgroundColor = .clear
        
//        sideMenuViewController?.delegate = self
    }
    

}

//extension FirstVC: AKSideMenuDelegate {
//    func sideMenu(_ sideMenu: AKSideMenu, willShowMenuViewController menuViewController: UIViewController) {
//        print("Show")
//    }
//}
