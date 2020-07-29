//
//  Dialog.swift
//  DemoReactCocoA
//
//  Created by Apple on 7/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


class Dialog {
    
    static let shared = Dialog()
    
    func showDialogOneTextField(target: UIViewController ,titleDialog: String?, msg: String?, titleAction: String, handleAction: @escaping (UIAlertAction, String) -> Void, handleTf: @escaping (UITextField) -> Void ) {
        let alert = UIAlertController(title: titleDialog, message: msg, preferredStyle: .alert)
     
        let action = UIAlertAction(title: titleAction, style: .default) { (action) in
            if let str  = alert.textFields?.first?.text {
                handleAction(action, str)
            }
        }
        let cancleAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        
        alert.addTextField { (tf) in
            handleTf(tf)
        }
        alert.addAction(action)
        alert.addAction(cancleAction)
        
        target.present(alert, animated: true, completion: nil)
    }
    
}
