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
    }
    
    @objc func onTapMenu() {
        print("tap")
        
        let navigation = UINavigationController(rootViewController: self)
        self.view.layer.cornerRadius = 10
        self.view.layer.masksToBounds = true
        
        let mainVC = MainController()
        mainVC.rootViewController = navigation
        
        let window = UIApplication.shared.keyWindow!
        window.rootViewController = mainVC
        
        UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: nil, completion: nil)

        sideMenuController?.showLeftViewAnimated()
        
    }

}
