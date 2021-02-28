//
//  ViewController.swift
//  DemoMultitarget
//
//  Created by Apple on 1/21/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        #if DEVELOPMENT
        print("RIO")
        #else
        print("ROI")
        #endif
    }


}

