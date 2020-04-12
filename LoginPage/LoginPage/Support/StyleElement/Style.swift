//
//  Style.swift
//  LoginPage
//
//  Created by Apple on 4/5/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import UIKit

class StyleElement {
    static func styleTF(tf: UITextField, placeHoder: String) {
        tf.placeholder = placeHoder
        tf.layer.cornerRadius = 10
    }
    
    static func styleBtn(btn: UIButton, title: String, colorTitle: UIColor, colorBackgroud: UIColor) {
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(colorTitle, for: .normal)
        btn.layer.cornerRadius = 15
        btn.backgroundColor = colorBackgroud
        btn.layer.borderWidth = 1
        
    }
}
