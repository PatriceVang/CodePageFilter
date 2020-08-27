//
//  ThirdVC.swift
//  testDelegate
//
//  Created by Apple on 5/26/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import NotificationCenter
import Alamofire

class ThirdVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    

    }

    @IBAction func onTapPopRootViewButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func onTextChangeTf(_ sender: UITextField) {
        let dataToPost: [AnyHashable: Any] = ["data": sender.text ?? ""]
        NotificationCenter.default.post(name: .thirdVCEmitText, object: nil, userInfo: dataToPost)
    }
}

extension NSNotification.Name {
    static var thirdVCEmitText = NSNotification.Name("thirdVCEmitText")
}
