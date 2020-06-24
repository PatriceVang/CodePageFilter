//
//  DetailVC.swift
//  CoreDataCRUD
//
//  Created by Apple on 6/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var name_Tf: UITextField!
    @IBOutlet weak var address_Tf: UITextField!
    var user: User? = nil
    weak var delegate: DetailVCDelegate?
    var indexpath: IndexPath? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        name_Tf.text = user!.name
        address_Tf.text = user!.address
        
    }
    
    @IBAction func onTapUpdateBtn(_ sender: UIButton) {
        self.delegate?.didUpdateUser(name: name_Tf.text!, address: address_Tf.text!, indexPath: indexpath ?? IndexPath())

        let popUP = UIAlertController(title: "Nottifycation", message: "Update successful", preferredStyle: .alert)
        
        present(popUP, animated: true) {
            popUP.dismiss(animated: true, completion: nil)
        }
        
    }
}

protocol DetailVCDelegate: class {
    func didUpdateUser(name: String, address: String, indexPath: IndexPath)
}


