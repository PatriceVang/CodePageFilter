//
//  SecondVC.swift
//  testDelegate
//
//  Created by Apple on 5/26/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class SecondVC: BaseVC {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapMoveThirdBtn(_ sender: Any) {
        
        self.navigationController?.pushViewController(ThirdVC(), animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
