//
//  HomeViewController.swift
//  DemoSildeMenu
//
//  Created by Apple on 10/8/20.
//

import UIKit
import LGSideMenuController

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .done, target: self, action: #selector(onTapMenu))
        
        self.view.layer.cornerRadius = 30
        self.view.layer.masksToBounds = true
    }
    
    
    @objc func onTapMenu() {
        print("tap")
        
        let navigation = UINavigationController(rootViewController: self)
        let mainVC = MainController()
        mainVC.rootViewController = navigation
        let window = UIApplication.shared.keyWindow!
        window.rootViewController = mainVC
        
        mainVC.rootViewLayerCornerRadius = 30
        mainVC.view.backgroundColor = .clear
        
        UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: nil, completion: nil)
        
        sideMenuController?.showLeftView()
        
       
        
    }

}


