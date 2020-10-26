//
//  BaseViewController.swift
//  DemoSildeMenu
//
//  Created by Apple on 10/12/20.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        self.view.layer.cornerRadius = 20
        self.view.layer.masksToBounds = true
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .done, target: self, action: #selector(onTapMenuBarButton))
        
        
    }
    
    @objc func onTapMenuBarButton() {
        openSideMenu()
    }

}
