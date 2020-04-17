//
//  Lable.swift
//  FashionApp
//
//  Created by Apple on 4/17/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class Lable: UILabel {
    var title: String = ""
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        initView(title: title)
    }
    func initView(title: String) {
        self.title = title
        self.font = .boldSystemFont(ofSize: 30)
        self.textColor = .white
    }
    
    
    
}
