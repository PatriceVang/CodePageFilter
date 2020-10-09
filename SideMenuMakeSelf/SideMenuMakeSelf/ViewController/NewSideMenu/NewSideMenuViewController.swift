//
//  NewSideMenuViewController.swift
//  SideMenuMakeSelf
//
//  Created by Apple on 10/9/20.
//

import UIKit

class NewSideMenuViewController: UIViewController {
    
    
    let leftButton = PhatSliderButton(image: UIImage(named: "menu"))

    override func viewDidLoad() {
        super.viewDidLoad()
//        leftButton.datasource = self
        navigationItem.leftBarButtonItem = leftButton

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        if let view = leftButton.hamburgerView as? HamburgerView {
//            view.setSelected(section: .SETTINGS)
//        }
    }


}

//extension NewSideMenuViewController: PhatSliderButtonDatasource {
//    func viewControllerHandle() -> UIViewController {
//        return self
//    }
    
//    func hamburgerView() -> UIView {
//        
//    }
    
    
//}


