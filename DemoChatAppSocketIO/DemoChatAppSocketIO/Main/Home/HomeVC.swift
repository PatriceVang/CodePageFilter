//
//  HomeVC.swift
//  DemoChatAppSocketIO
//
//  Created by Apple on 7/18/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SocketIOManager.shared.estaplishConnection()
        
        setupUI()
    }
    
    private func setupUI() {
        
    }

}
