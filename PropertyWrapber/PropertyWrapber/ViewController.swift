//
//  ViewController.swift
//  PropertyWrapber
//
//  Created by Apple on 3/25/21.
//  Copyright © 2021 vinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var number = 0
    @IBOutlet weak var lbContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbContent.text = "\(number)"
        
    }

    @IBAction func btnGet(_ sender: UIButton) {
        guard let newNumber = UserDefaultHelper.shared.number else {return}
        let numberCondition = NumberCondition(value: Number(value: newNumber))
        lbContent.text = String(numberCondition.value)
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        number += 1
        UserDefaultHelper.shared.number = number
    }
}

