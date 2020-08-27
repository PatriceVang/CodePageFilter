//
//  HomeVC.swift
//  testDelegate
//
//  Created by Apple on 5/26/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit



class HomeVC: UIViewController {

    
    @IBAction func onTFChanged(_ sender: UITextField) {
        let dataToPost: [AnyHashable: Any] = ["data": sender.text ?? ""]
        NotificationCenter.default.post(name: .thirdVCEmitText, object: nil, userInfo: dataToPost)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        
        

        // Do any additional setup after loading the view.
    }

}
