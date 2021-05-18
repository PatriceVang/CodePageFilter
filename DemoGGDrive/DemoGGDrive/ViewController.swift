//
//  ViewController.swift
//  DemoGGDrive
//
//  Created by Apple on 5/18/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import GoogleSignIn
import HSGoogleDrivePicker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        
    }
    
    @IBAction func tap(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    @IBAction func gg(_ sender: Any) {
        let picker = HSDrivePicker()
        picker.pick(from: self) { (manager, files) in
            print(files)
        }
        
    }
    
}

