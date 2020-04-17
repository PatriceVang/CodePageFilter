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
    var headerLogin = Lable()
    var presenter: PresenterProtocol?
    init() {
        super.init(nibName: "LoginController", bundle: nil)
        presenter = Presenter()
        presenter?.view = self
    }
    @IBAction func tfOnchangeEmail(_ sender: Any) {
        guard let textfield = sender as? UITextField else {return}
        if textfield.text != "" {
            lbErrEmail.text = ""
        }
    }
    @IBAction func tfOnchangePassword(_ sender: Any) {
        guard let textfield = sender as? UITextField else {return}
        if textfield.text != "" {
            lbErrPassword.text = ""
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLogin.initView(title: Resource.Text.logIn)
        navigationItem.titleView = headerLogin
        navigationController?.navigationBar.barTintColor = Resource.Color.colorHeader
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
        //Save data
        tfEmail.text =  UserDefaults.standard.string(forKey: "email")
        tfPassword.text = UserDefaults.standard.string(forKey: "password")
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
    //MARK: Handle Login
    @IBAction func onTapBtnConfirm(_ sender: Any) {
        self.presenter?.validate(email: tfEmail.text!, password: tfPassword.text!)
    }
    //MARK: Create user
    @IBAction func onTapCreteUser(_ sender: Any) {
        let nib = SignUpController(nibName: "SignUpController", bundle: nil)
        self.navigationController?.pushViewController(nib, animated: true)
    }
}

extension LoginController: PresenterDelegate {
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
        Dialog.showDialog(title: "Login", msg: msg, titleAction: "OK", target: self)
    }
    func loginSuccess() {
        UserDefaults.standard.set(tfEmail.text, forKey: "email")
        UserDefaults.standard.set(tfPassword.text, forKey: "password")
        let tabbarVC = TapBarController()
        self.navigationController?.pushViewController(tabbarVC, animated: true)
    }
}
