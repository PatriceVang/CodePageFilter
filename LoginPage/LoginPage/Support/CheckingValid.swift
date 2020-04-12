//
//  CheckingValid.swift
//  LoginPage
//
//  Created by Apple on 4/5/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation

class CheckingValid {

    static func isValidPassword(password: String) -> Bool {
        let passWordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,}")
        return passWordTest.evaluate(with: password)
    }
}
