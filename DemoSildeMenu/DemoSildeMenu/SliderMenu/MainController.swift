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
        leftViewController = LeftViewController()
        leftViewWidth = 250
        leftViewBackgroundColor = .white
        
        leftViewPresentationStyle = .scaleFromBig
    }
    
}
