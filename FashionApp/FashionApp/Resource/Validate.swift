//
//  Validate.swift
//  FashionApp
//
//  Created by Apple on 4/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


class Validate {
    static func isValidatePassword(password: String) -> Bool {
        let passWordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,}")
        return passWordTest.evaluate(with: password)
    }
    static func lbShowError(msg: String, lable: UILabel) {
           lable.text = msg
           lable.textColor = .red
           lable.alpha = 0.5
    }
}
