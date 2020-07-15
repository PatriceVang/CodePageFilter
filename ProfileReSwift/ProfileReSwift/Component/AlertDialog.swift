//
//  AlertDialog.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import UIKit

class AlertDialog {
    
    
    static func showUpdateNameDialog(on: UIViewController, title: String?, msg: String?, textfield: @escaping (UITextField) -> Void,okAction: @escaping (UIAlertAction, String?) -> Void) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addTextField { (tf) in
            textfield(tf)
        }

        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            guard let text = alert.textFields?.first?.text else {return}
            okAction(action, text)
        }
        
        let cancleAction = UIAlertAction(title: "Cancle", style: .default, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        on.present(alert, animated: true, completion: nil)
        
        
    }
}
