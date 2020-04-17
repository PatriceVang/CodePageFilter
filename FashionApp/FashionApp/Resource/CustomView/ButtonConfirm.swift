//
//  ButtonConfirm.swift
//  FashionApp
//
//  Created by Apple on 4/17/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ButtonConfirm: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)  
        initView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    func initView() {
        self.layer.cornerRadius = 15
        self.backgroundColor = #colorLiteral(red: 1, green: 0.3909804772, blue: 0.5798481978, alpha: 1)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 25)
        self.showsTouchWhenHighlighted = true
    }
}

