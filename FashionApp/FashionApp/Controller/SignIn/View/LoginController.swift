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
    //MARK: Proberty
    var headerLogin = Lable()
    var presenter: PresenterSignInProtocol?
    //MARK: Intit
    init() {
        super.init(nibName: "LoginController", bundle: nil)
        presenter = PresenterSignIn()
        presenter?.view = self
    }
    @IBAction func tfOnchangeEmail(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        self.presenter?.handleTfOnchange(textfield: textField, lable: lbErrEmail)
    }
    @IBAction func tfOnchangePassword(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        self.presenter?.handleTfOnchange(textfield: textField, lable: lbErrPassword)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.text =  UserDefaults.standard.string(forKey: "email")
        tfPassword.text = UserDefaults.standard.string(forKey: "password")
        customElement()
        hideKeyBoard()
    }
  
    override func viewWillAppear(_ animated: Bool) {
         self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    //Hiden keyboard
    func  hideKeyBoard() {
       let tapOutSide = UITapGestureRecognizer(target: self, action: #selector(onTapOutSide))
       view.addGestureRecognizer(tapOutSide)
    }
    @objc func onTapOutSide() {
        view.endEditing(true)
    }
    //MARK: Custom Element
    private func customElement() {
        // Set title header
        headerLogin.setTile(title: Resource.Text.logIn)
        self.navigationItem.titleView = headerLogin
        self.navigationController?.navigationBar.barTintColor = Resource.Color.colorHeader
        UserDefaults.standard.string(forKey: tfPassword.text!)
        //Img Logo
        Resource.StyleElement.ImgView(imgView: imgLogo)
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
    //MARK:  Login
    @IBAction func onTapBtnConfirm(_ sender: Any) {
        self.presenter?.validate(email: tfEmail.text!, password: tfPassword.text!)
    }
    //MARK: Create user
    @IBAction func onTapCreteUser(_ sender: Any) {
        self.presenter?.onPushScreenSignUp(view: self)
    }
}

extension LoginController: PresenterSignInDelegate {
    func passwordIsInvalid(msg: String) {
        Validate.lbShowError(msg: msg, lable: lbErrPassword)
    }
    func emailIsEmpty(msg: String) {
        Validate.lbShowError(msg: msg, lable: lbErrEmail)
    }
    func passwordIsEmpty(msg: String) {
        Validate.lbShowError(msg: msg, lable: lbErrPassword)
    }
    func loginFailed(msg: String) {
        Dialog.showDialog(title: Resource.Text.logIn, msg: msg, titleAction: Resource.Text.ok, target: self)
    }
    func loginSuccess() {
        UserDefaults.standard.set(tfEmail.text, forKey: "email")
        UserDefaults.standard.set(tfPassword.text, forKey: "password")
        let tabbarVC = TapBarController()
        self.navigationController?.pushViewController(tabbarVC, animated: true)
    }
}
