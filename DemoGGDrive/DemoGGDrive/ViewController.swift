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
    
    private let btnMy: MyButton = {
       let btn = MyButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        view.addSubview(btnMy)
        btnMy.addTarget(self, action: #selector(tapMyButton(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            btnMy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnMy.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
        
    }
    
    @objc func tapMyButton(_ sender: UIButton) {
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

