//
//  BaseView.swift
//  MVVMOne
//
//  Created by Apple on 6/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit



extension UILabel {
    convenience init(frame: CGRect, text: String, font: UIFont, textColor: UIColor) {
        self.init(frame: frame)
        self.text = text
        self.font = font
        self.textColor = textColor
    }
    
}


