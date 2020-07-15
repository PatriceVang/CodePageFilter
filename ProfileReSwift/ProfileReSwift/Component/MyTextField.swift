//
//  MyTextField.swift
//  ProfileReSwift
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


enum TextFiledStyle {
    case changePassword
    case confirmPassword
}


class MyTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
//        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(style: TextFiledStyle) {
        self.init(frame: .zero)
        switch style {
        case .changePassword:
            backgroundColor = .white
            layer.cornerRadius = 10
            layer.masksToBounds = true
            layer.borderWidth = 1
            layer.borderColor = UIColor.black.cgColor
        case .confirmPassword:
            backgroundColor = .white
            layer.cornerRadius = 5
            layer.masksToBounds = true
            layer.borderWidth = 1
            layer.borderColor = UIColor.black.cgColor
        }
    }
}

