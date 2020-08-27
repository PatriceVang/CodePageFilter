//
//  HomeViewController.swift
//  DemoSwiftPackage
//
//  Created by Apple on 8/20/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import MyService

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = MyText.name

        // Do any additional setup after loading the view.
    }
    @IBAction func onPressShowDialogButton(_ sender: UIButton) {
        Alert.showMessage(self)
    }
    
}
