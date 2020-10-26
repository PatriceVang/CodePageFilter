//
//  SecondVC.swift
//  DemoSildeMenu
//
//  Created by Apple on 10/14/20.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Leaning"

        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left",
                                                                        style: .plain,
                                                                        target: self,
                                                                        action: #selector(presentLeftMenuViewController(_:)))
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
