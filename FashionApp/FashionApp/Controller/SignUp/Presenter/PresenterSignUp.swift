//
//  PresenterSignUp.swift
//  FashionApp
//
//  Created by Apple on 4/17/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import Firebase

protocol PresenterSignUpDelegate: class {
    func signUpFailure(msg: String)
    func signUpSuccess(msg: String)
    func saveDataError(msg: String)
    func nameIsEmpty(msg: String)
    func numberPhongeIsEmpty(msg: String)
    func emailIsEmpty(msg: String)
    func passwordIsEmpty(msg: String)
    func passwordInvalid(msg: String)
}

protocol PresenterSignUpProtocol {
    var view: PresenterSignUpDelegate? { get set }
    func signUp(email: String, password: String, name: String, numberPhone: String)
    func handelOnchangeTf(textfield: UITextField, lable: UILabel)
}

class PresenterSignUp: PresenterSignUpProtocol {
    weak var view: PresenterSignUpDelegate?
    func signUp(email: String, password: String, name: String, numberPhone: String) {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            self.view?.nameIsEmpty(msg: "*Name is empty")
        } else {
            if numberPhone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                self.view?.numberPhongeIsEmpty(msg: "*Number phone is empty")
            } else {
                if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    self.view?.emailIsEmpty(msg: "*Email is empty")
                } else {
                    if password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty  {
                        self.view?.passwordIsEmpty(msg: "*Password is empty")
                    }else if Validate.isValidatePassword(password: password.trimmingCharacters(in: .whitespacesAndNewlines)) == false {
                        self.view?.passwordInvalid(msg: "Password is 6 at least character , contains 1 character Uppercase and 1 charater LowerCase")
                    } else {
                        self.veritySignUp(name: name, numberPhone: numberPhone, email: email, password: password)
                    }
                }
            }
        }
    }
    
    private func veritySignUp(name: String, numberPhone: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email.trimmingCharacters(in: .whitespacesAndNewlines), password: password.trimmingCharacters(in: .whitespacesAndNewlines)) { (result, err) in
            if err != nil {
                self.view?.signUpFailure(msg: "Sign up is failed")
            } else {
                let db =  Firestore.firestore()
                db.collection("users").addDocument(data: ["name": name as Any, "numberphone": numberPhone as Any, "uid": result?.user.uid as Any]) { (error) in
                    if error != nil {
                        self.view?.saveDataError(msg: "Save data failed")
                    }
                }
                self.view?.signUpSuccess(msg: "You are signup successful")
            }
        }
    }
    func handelOnchangeTf(textfield: UITextField, lable: UILabel) {
        if textfield.text! != nil {
            lable.text = ""
        }
    }
}



