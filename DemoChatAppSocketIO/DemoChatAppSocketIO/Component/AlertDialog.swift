//
//  AlertDialog.swift
//  DemoChatAppSocketIO
//
//  Created by Apple on 7/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit



class AlertDialog {
    static let shared = AlertDialog()
    
    func showOneTextField(target: UIViewController, handleAction: @escaping (String) -> Void, title: String?, msg: String?, titleAction: String, textField: @escaping (UITextField) -> Void) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: titleAction, style: .default) { (action) in
            if let text = alert.textFields?.first?.text {
                handleAction(text)
            }
        }
        let actionCancle = UIAlertAction(title: "Cancle", style: .default, handler: nil)
        
        alert.addTextField { (tf) in
            textField(tf)
        }

        alert.addAction(actionOK)
        alert.addAction(actionCancle)
        target.present(alert, animated: true, completion: nil)
        
    }
}
