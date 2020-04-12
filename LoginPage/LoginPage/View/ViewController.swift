//
//  ViewController.swift
//  LoginPage
//
//  Created by Apple on 4/5/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBtn()
        view.backgroundColor = .blue    }
    
    @IBAction func onTapSignIn(_ sender: Any) {
        let signInVC = LoginController(nibName: "LoginController", bundle: nil)
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
    
    @IBAction func onTapSignUp(_ sender: Any) {
        let signUpVC = SignUpController(nibName: "SignUpController", bundle: nil)
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    private func createBtn() {
        StyleElement.styleBtn(btn: btnSignIn, title: "Sign In", colorTitle: .black, colorBackgroud: .cyan)
        StyleElement.styleBtn(btn: btnSignUp, title: "Sign Up", colorTitle: .black, colorBackgroud: .green)

    }
}
