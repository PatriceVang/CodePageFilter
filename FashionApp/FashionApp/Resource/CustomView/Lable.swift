//
//  Lable.swift
//  FashionApp
//
//  Created by Apple on 4/17/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class Lable: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        initView()
    }
    func initView() {
        self.font = .boldSystemFont(ofSize: 30)
        self.textColor = .white
    }
    
    func setTile(title: String) {
        self.text = title
    }
}
