//
//  SignUpController.swift
//  FashionApp
//
//  Created by Apple on 4/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Firebase

class SignUpController: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNumberPhone: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lbErrName: UILabel!
    @IBOutlet weak var lbErrNumberPhone: UILabel!
    @IBOutlet weak var lbErrPassword: UILabel!
    @IBOutlet weak var lbErrEmail: UILabel!
    @IBOutlet weak var btnConfirmSignup: UIButton!
    var headerSignUp = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerSignUp)

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.titleView = Resource.LableText.lableText(lable: headerSignUp, font: .systemFont(ofSize: 30), title: "Sign Up", titleColor: .white)
        self.navigationController?.navigationBar.barTintColor = Resource.Color.colorHeader
    }
    //MARK: Handle create user
    @IBAction func onTapBtnConfirmsignup(_ sender: Any) {
        let name = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let numberPhone = tfNumberPhone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if name == "" {
            Validate.lbShowError(msg: "*Please fill in this field", lable: lbErrName)
        }
        if numberPhone == "" {
            Validate.lbShowError(msg: "*Please fill in this field", lable: lbErrNumberPhone)
        }
        if email == "" {
            Validate.lbShowError(msg: "*Please fill in this field", lable: lbErrEmail)
        }
        if password == "" {
            Validate.lbShowError(msg: "*Please fill in this field", lable: lbErrPassword)
        }
        //Checking ensure valid password
        let checkingPassword = tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if Validate.isValidatePassword(password: checkingPassword!) == false {
            return Validate.lbShowError(msg: "Password is invalid", lable: lbErrPassword)
        }
        //Create user
        Auth.auth().createUser(withEmail: email!, password: password!) { (result, error) in
            if error != nil {
                Dialog.showDialog(title: "SignUp", msg: "Create user failed", titleAction: "OK", target: self)
            } else {
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["name" : name as Any, "numberphone" : numberPhone as Any, "uid" : result?.user.uid as Any]) { (error) in
                    if error != nil {
                        Dialog.showDialog(title: "SignUp", msg: "Error saving data", titleAction: "OK", target: self)
                    }
                }
                // Dang ki thanh cong
                Dialog.showDialog(title: "Sign Up", msg: "You created success!", titleAction: "Ok", target: self)
                self.lbErrPassword.text = ""
                self.lbErrEmail.text = ""
                self.lbErrName.text = ""
                self.lbErrNumberPhone.text = ""
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
