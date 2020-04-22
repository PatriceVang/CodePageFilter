//
//  Presenter.swift
//  FashionApp
//
//  Created by Apple on 4/17/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Firebase

protocol PresenterSignInDelegate: class {
    func loginFailed(msg: String)
    func emailIsEmpty(msg: String)
    func passwordIsEmpty(msg: String)
    func passwordIsInvalid(msg: String)
    func loginSuccess()
}

protocol PresenterSignInProtocol {
    var view: PresenterSignInDelegate? {get set}
    func validate(email: String, password: String)
    func onPushScreenSignUp(view: UIViewController)
    func handleTfOnchange(textfield: UITextField, lable: UILabel)
}

class PresenterSignIn: PresenterSignInProtocol {
  
    
    weak var view: PresenterSignInDelegate?
    
    func validate(email: String, password: String) {
        if email == ""{
            self.view?.emailIsEmpty(msg: "*Email is empty")
        } else {
            if password == "" {
                self.view?.passwordIsEmpty(msg: "*Password is empty")
            }else if Validate.isValidatePassword(password: password) == false {
                self.view?.passwordIsInvalid(msg: "Password is 6 at least character , contains 1 character Uppercase and 1 charater LowerCase")
            } else {
                self.verity(email: email, password: password)
            }
        }
    }
    
    private func verity(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, err) in
            if err != nil {
                self?.view?.loginFailed(msg: "Email or Password is invalid")
            } else {
                self?.view?.loginSuccess()
            }
        }
    }

    func onPushScreenSignUp(view: UIViewController) {
        let nib = SignUpController()
        view.navigationController?.pushViewController(nib, animated: true)
    }
    
    func handleTfOnchange(textfield: UITextField, lable: UILabel) {
        if textfield.text != nil {
            lable.text = ""
        }
    }
 
}

