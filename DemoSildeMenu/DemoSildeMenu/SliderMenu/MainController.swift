//
//  MainController.swift
//  DemoSildeMenu
//
//  Created by Apple on 10/8/20.
//

import Foundation
import LGSideMenuController


class MainController: LGSideMenuController {
    
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        
//        sideMenuController?.delegate = self
        leftViewController = LeftViewController()
        leftViewWidth = 250
        leftViewBackgroundColor = .white
        leftViewPresentationStyle = .scaleFromBig
        
        rightViewController?.view.layer.cornerRadius = 20
        rightViewController?.view.layer.masksToBounds = true
    }
    
}

//extension MainController: LGSideMenuDelegate {
//    func willShowLeftView(_ leftView: UIView, sideMenuController: LGSideMenuController) {
//
//    }
//}
