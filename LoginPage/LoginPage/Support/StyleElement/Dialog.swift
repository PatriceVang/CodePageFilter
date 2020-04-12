//
//  Dialog.swift
//  LoginPage
//
//  Created by Apple on 4/6/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Foundation

class Dialog {
    static func showDialog(title: String, description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let btnOK = UIAlertAction(title: "OK", style: .default) { (action) in
            print(action)
        }
        alert.addAction(btnOK)
        
    }

}
