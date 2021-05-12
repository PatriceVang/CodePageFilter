//
//  AddUserVC.swift
//  TestCoreData
//
//  Created by Apple on 5/12/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class AddUserVC: UIViewController {
    @IBOutlet weak var tfId: UITextField!
    
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func confrimAddUser(_ sender: UIButton) {
        if let id = tfId.text, let name = tfName.text {
//            User.share.saveUser(name: name, id: Int(id) ?? 0)
        }
    }
}
