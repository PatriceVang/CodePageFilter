//
//  DetailVC.swift
//  DemoVIPER
//
//  Created by Apple on 7/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var presenter: DetailViewToPresenter!
    
    @IBOutlet weak var updateTitle_TF: UITextField!
    var textFromUser = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitle_TF.text = textFromUser
    }

    @IBAction func onTapConfirmBtn(_ sender: UIButton) {
        //let userVC = UserRouter.createModule()
        //userVC.titleScreen = updateTitle_TF.text!
        //userVC.presenter.router?.popToUserScreen(navi: self.navigationController!)
      
    }
}

extension DetailVC: DetailPresenterToView {
    func showData() {
        
    }
}
