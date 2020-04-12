//
//  LoginController.swift
//  LoginPage
//
//  Created by Apple on 4/5/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lbErrSignIn: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewLogin()
    }
    @IBAction func onTapBtnLogin(_ sender: Any) {
        //Checked valiate
        if tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            showError(msg: "Please! Filled in all the textfield")
        } else {
            // Sign in
            let email = tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().signIn(withEmail: email!, password: password!) { (result, error) in
                if error != nil {
                    self.showError(msg: "Email or Password is invalid!")
                } else {
                    self.showDialog(title: "Sign in", description: "You are sign in successfull!")
                    self.lbErrSignIn.text = ""
                }
            }
        }
 
    }
 
    private func setupViewLogin() {
      
        StyleElement.styleTF(tf: tfEmail, placeHoder: "Email")
        StyleElement.styleTF(tf: tfPassword, placeHoder: "Password")
        StyleElement.styleBtn(btn: btnLogin, title: "Login", colorTitle: .white, colorBackgroud: .systemBlue)
        lbErrSignIn.textColor = .red
        lbErrSignIn.text = ""
    }
    
    private func showError(msg: String) {
        lbErrSignIn.text = msg
        lbErrSignIn.alpha = 1
    }
    
    private func showDialog(title: String, description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let btnOK = UIAlertAction(title: "OK", style: .default) { (action) in
            print(action)
        }
        alert.addAction(btnOK)
        present(alert, animated: true, completion: nil)
    }


}
