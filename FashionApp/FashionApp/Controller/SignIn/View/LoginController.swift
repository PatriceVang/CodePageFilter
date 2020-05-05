//
//  LoginController.swift
//  FashionApp
//
//  Created by Apple on 4/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import GoogleSignIn

class LoginController: BaseView, GIDSignInDelegate  {
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lbErrEmail: UILabel!
    @IBOutlet weak var lbErrPassword: UILabel!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var viewFacebook: UIView!
    @IBOutlet weak var viewGoogle: UIView!
    lazy var displayPassWordBtn: UIButton = {
       let dis = UIButton()
        dis.heightAnchor.constraint(equalToConstant: 25).isActive = true
        dis.widthAnchor.constraint(equalToConstant: 25).isActive = true
        dis.translatesAutoresizingMaskIntoConstraints = false
        dis.setImage(Resource.Image.imgEye, for: .normal)
        dis.addTarget(self, action: #selector(displayPassWord), for: .touchUpInside)
        return dis
    }()
    //MARK: Proberty
    var headerLogin = Lable()
    var presenter: PresenterSignInProtocol?
    var isLoginSuccess: Bool = false
    //MARK: Init
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
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.text =  UserDefaults.standard.string(forKey: "email")
        tfPassword.text = UserDefaults.standard.string(forKey: "password")
        customElement()
        hideKeyBoard()
        //Google
        GIDSignIn.sharedInstance().delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationItem.hidesBackButton = true
        self.navigationItem.titleView = headerLogin
        self.navigationController?.navigationBar.barTintColor = Resource.Color.colorHeader
    }
    //MARK: Handle tap
    // display
    @objc func displayPassWord() {
        tfPassword.isSecureTextEntry = !tfPassword.isSecureTextEntry
    }
    //login
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
         if let error = error {
            print(error.localizedDescription)
           return
         } else {
            guard let authentication = user.authentication else { return }
            _ = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            let tabbarVC = TapBarController()
            self.navigationController?.pushViewController(tabbarVC, animated: true)
        }
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
        //Img Logo
        Resource.StyleElement.ImgView(imgView: imgLogo)
        //View
        Resource.StyleElement.radiusElement(element: viewFacebook, radius: 25)
        Resource.StyleElement.radiusElement(element: viewGoogle, radius: 25)
        //Gesture
        let onTapFaceBook = UITapGestureRecognizer(target: self, action: #selector(onTapViewFaceBook))
        self.viewFacebook.isUserInteractionEnabled = true
        self.viewFacebook.addGestureRecognizer(onTapFaceBook)
        let onTapGoogle = UITapGestureRecognizer(target: self, action: #selector(onTapViewGoogle))
        self.viewGoogle.isUserInteractionEnabled = true
        self.viewGoogle.addGestureRecognizer(onTapGoogle)
        tfPassword.isSecureTextEntry = true
        tfPassword.addSubview(displayPassWordBtn)
        displayPassWordBtn.trailingAnchor.constraint(equalTo: tfPassword.trailingAnchor, constant: -10).isActive = true
        displayPassWordBtn.centerYAnchor.constraint(equalTo: tfPassword.centerYAnchor).isActive = true
    }
    
    @objc func onTapViewFaceBook() {
        self.setupAnimationColor(view: viewFacebook, delay: 0, target: self)
        let fbLoginMan = LoginManager()
        fbLoginMan.logIn(permissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            let fbLoginResult: LoginManagerLoginResult = result!
            //user cancle login
            if result!.isCancelled {
                return
            }
            if fbLoginResult.grantedPermissions.contains("email") {
                if AccessToken.current != nil {
                    GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start { (conection, result, error) in
                        if error == nil {
                            let tabbarVC = TapBarController()
                            self.navigationController?.pushViewController(tabbarVC, animated: true)
                        }
                    }
                }
            }
        }
    }
    @objc func onTapViewGoogle() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        self.setupAnimationColor(view: viewGoogle, delay: 0, target: self)
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
//        UserDefaults.standard.set(tfPassword.text, forKey: "password")
        let tabbarVC = TapBarController()
        self.navigationController?.pushViewController(tabbarVC, animated: true)
    }
}
