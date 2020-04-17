//
//  Dialog.swift
//  FashionApp
//
//  Created by Apple on 4/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class Dialog {
    static func showDialog(title: String, msg: String, titleAction: String, target: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: titleAction, style: .default, handler: nil)
        alert.addAction(actionOk)
        target.present(alert, animated: true, completion: nil)
    }
    
    
}
