//
//  HelloVC.swift
//  DemoUIPageViewController
//
//  Created by Apple on 4/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class HelloVC: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapPushBtn(_ sender: Any) {
        print("push")
        let worldVC = WorldVC()
        self.navigationController?.pushViewController(worldVC, animated: true)
    }

}
