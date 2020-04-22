//
//  TitleAndInput.swift
//  CustomView
//
//  Created by Apple on 4/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


class TitleAndInput: BaseViewXib {
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var inputTF: UITextField!
    
    // Config View's
    override func initView() {
        
    }
    
    func setUpViewLb(title: String) {
        self.titleLB.text = title
        self.titleLB.font = .systemFont(ofSize: 25)
    }
    
    func setUpViewTf(placeHolder: String, radius: CGFloat) {
        self.inputTF.placeholder = placeHolder
        self.inputTF.borderStyle = .none
        self.inputTF.layer.cornerRadius = radius
        self.inputTF.clipsToBounds = true
        self.inputTF.layer.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        self.inputTF.layer.borderWidth = 2
        let padding = UIView(frame: .init(x: 0, y: 0, width: 10, height: self.inputTF.frame.height))
        self.inputTF.leftView = padding
        self.inputTF.leftViewMode = .always
        self.inputTF.backgroundColor = .white
    }
    
}
