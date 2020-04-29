//
//  WorldVC.swift
//  DemoUIPageViewController
//
//  Created by Apple on 4/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class WorldVC: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        // Do any additional setup after loading the view.
        
    }

    @IBAction func popBtn(_ sender: Any) {
        print("pop")
        self.navigationController?.popViewController(animated: true)
    }

}
