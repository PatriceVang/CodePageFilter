//
//  Textfield.swift
//  FashionApp
//
//  Created by Apple on 4/17/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


class Textfield: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
       
    }
    func initView()  {
        self.layer.cornerRadius = 7
        self.borderStyle = .none
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 1, green: 0.3909804772, blue: 0.5798481978, alpha: 1)
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = padding
        self.leftViewMode = .always
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}


