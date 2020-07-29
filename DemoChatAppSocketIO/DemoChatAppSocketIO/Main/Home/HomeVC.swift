//
//  HomeVC.swift
//  DemoChatAppSocketIO
//
//  Created by Apple on 7/18/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var nickname_Lb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        SocketIOManager.shared.estaplishConnection()
        
        SocketIOManager.shared.observerChangeNickname { (str) in
//            self.nickname_Lb.text = str
            print(str)
        }
    }
    
    private func setupUI() {
        
        
        SocketIOManager.shared.observerChangeNickname { (str) in
            print("Data tra ve" + "\(str)")
        }
    }
    @IBAction func onTapUpdateNickName(_ sender: UIButton) {
        
        AlertDialog.shared.showOneTextField(target: self, handleAction: { (str) in
            SocketIOManager.shared.updateNickName(nickName: str)
        }, title: "Update Nick Name", msg: nil, titleAction: "OK") { (tf) in
            tf.placeholder = "New Nick Name"
        }
    }
    
    
    
    

}
