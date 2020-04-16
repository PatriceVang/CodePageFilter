//
//  LoginController.swift
//  FashionApp
//
//  Created by Apple on 4/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lbErrEmail: UILabel!
    @IBOutlet weak var lbErrPassword: UILabel!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var viewFacebook: UIView!
    @IBOutlet weak var viewGoogle: UIView!
    var headerLogin = UILabel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerLogin)
        navigationItem.titleView = Resource.LableText.lableText(lable: headerLogin, font: .systemFont(ofSize: 30), title: "Login", titleColor: .white)
        
        navigationController?.navigationBar.barTintColor = Resource.Color.colorHeader
        customElement()
    }
    override func viewWillAppear(_ animated: Bool) {
         self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    //MARK: Custom Element
    private func customElement() {
        //Textfield
        Resource.StyleElement.styleTextField(textfield: tfEmail, placeHolder: "email@gamil.com")
        Resource.StyleElement.styleTextField(textfield: tfPassword, placeHolder: "Aa1234")
        //Button
        Resource.StyleElement.styleBtn(btn: btnConfirm, title: "Confirm")
        btnConfirm.showsTouchWhenHighlighted = true
        //Img Logo
        Resource.StyleElement.ImgView(imgView: imgLogo)
        // Save data
        tfEmail.text = UserDefaults.standard.string(forKey: "email")
        tfPassword.text = UserDefaults.standard.string(forKey: "password")
        //Gesture
        let onTapFaceBook = UITapGestureRecognizer(target: self, action: #selector(onTapViewFaceBook))
      
        self.viewFacebook.isUserInteractionEnabled = true
        self.viewFacebook.addGestureRecognizer(onTapFaceBook)
        let onTapGoogle = UITapGestureRecognizer(target: self, action: #selector(onTapViewGoogle))
        self.viewGoogle.isUserInteractionEnabled = true
        self.viewGoogle.addGestureRecognizer(onTapGoogle)
        
       
    }
    @objc func onTapViewFaceBook() {
        print("fb")
    }
    @objc func onTapViewGoogle() {
        print("gg")
    }
    //MARK: Handle Login
    @IBAction func onTapBtnConfirm(_ sender: Any) {
        guard let email = tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let password = tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        if email == "" {
            Validate.lbShowError(msg: "*Email is empty", lable: lbErrEmail)
        }else if password == "" {
            Validate.lbShowError(msg: "*Password is empty", lable: lbErrPassword)
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    Dialog.showDialogSignUp(title: "Login", msg: "Email or Password is invalid", titleAction: "OK", target: self)
                } else {
                    UserDefaults.standard.set(email, forKey: "email")
                    UserDefaults.standard.set(password, forKey: "password")
                    let tabbarVC = TapBarController()
                    self.navigationController?.pushViewController(tabbarVC, animated: true)
                }
            }
        }
    }
    //MARK: Create user
    @IBAction func onTapCreteUser(_ sender: Any) {
        let nib = SignUpController(nibName: "SignUpController", bundle: nil)
        self.navigationController?.pushViewController(nib, animated: true)
    }
}
