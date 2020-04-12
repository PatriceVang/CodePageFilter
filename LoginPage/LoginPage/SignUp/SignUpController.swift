//
//  SignUpController.swift
//  LoginPage
//
//  Created by Apple on 4/5/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Firebase

class SignUpController: UIViewController {
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lbErr: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
   
    private func setupView() {
        StyleElement.styleTF(tf: tfFirstName, placeHoder: "First name")
        StyleElement.styleTF(tf: tfLastName, placeHoder: "Last name")
        StyleElement.styleTF(tf: tfEmail, placeHoder: "Email")
        StyleElement.styleTF(tf: tfPassword, placeHoder: "Password")
        StyleElement.styleBtn(btn: btnSignUp, title: "Sign Up", colorTitle: .white, colorBackgroud: .systemBlue)
        
        lbErr.textColor = .red
        lbErr.text = ""
    }
    //If correct, is nil, otherwise is Error type String
    private func validateField() -> String? {
        //Check that is filled
        if tfFirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || tfLastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all field"
        }
        //Check if password is secure
        let cleanedPassword = tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if CheckingValid.isValidPassword(password: cleanedPassword!) == false {
            return "Password is at least 6 charater, must have 1 number and 1 Charater to Uppercase and not contain special charater"
        }
        return nil
    }
    
    @IBAction func onTapBtnsignUp(_ sender: Any) {
    
        //Validate the field
        let err = validateField()
        if err != nil {
            showError(msg: err!)
        } else {
            //Creat users
            let firstName = tfFirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = tfLastName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            //Create user with email and password
            Auth.auth().createUser(withEmail: email!, password: password!) { (result, error) in
                //Check error
                if error != nil {
                    self.showError(msg: "Cearte user failed")
                } else {
                //Add to user : last and firstname
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname" : firstName as Any, "lastname" : lastName as Any, "uid" : result?.user.uid as Any]) { (error) in
                        if error != nil {
                            self.showError(msg: "Error saving data")
                        }
                    }
                }
            }
            //Result is:
            self.showDialog(title: "Sign Up", description: "You created success!")
            self.lbErr.text = ""
        }
    }
    private func showError(msg: String) {
        lbErr.text = msg
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
