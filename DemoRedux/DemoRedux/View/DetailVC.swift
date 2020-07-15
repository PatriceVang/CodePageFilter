//
//  DetailVC.swift
//  DemoRedux
//
//  Created by Apple on 7/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var input_Tf: UITextField!
    
    var homeStateController: HomeStateController

//    var detaiStateControlller: DetailStateController

    lazy var detalState = Subcriber<DetailState>(block: nil)
    
    init() {
//        self.detaiStateControlller = DetailStateController()
        self.homeStateController = HomeStateController()
        super.init(nibName: "DetailVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if homeStateController.displayTitle.isAllowed {
             input_Tf.text = String(homeStateController.counter)
        }
        
       
    }
    @IBAction func onTapConfirm_Btn(_ sender: Any) {
         homeStateController.displaytitle(title: input_Tf.text!)
        homeStateController.allowedDisplayText(isAllowed: false)
    }
    
}
