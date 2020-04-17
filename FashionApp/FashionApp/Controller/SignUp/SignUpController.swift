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
    var titleSignUp = Lable()
    var presenterSignUp: PresenterSignUpProtocol
    init() {
        presenterSignUp = PresenterSignUp()
        super.init(nibName: "SignUpController", bundle: nil)
        presenterSignUp.view = self
        
    }
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        titleSignUp.setTile(title: Resource.Text.sighUp)
        self.navigationItem.titleView = titleSignUp
        self.navigationController?.navigationBar.barTintColor = Resource.Color.colorHeader
    }
    //MARK: Handle onchange textfield
    
    @IBAction func tfOnchangeName(_ sender: Any) {
        guard let textfield = sender as? UITextField else {return}
        self.presenterSignUp.handelOnchangeTf(textfield: textfield, lable: lbErrName)
    }
    @IBAction func tfOnchangeNumberPhone(_ sender: Any) {
        guard let textfield = sender as? UITextField else {return}
        self.presenterSignUp.handelOnchangeTf(textfield: textfield, lable: lbErrNumberPhone)
        
    }
    @IBAction func tfOnchangeEmail(_ sender: Any) {
        guard let textfield = sender as? UITextField else {return}
        self.presenterSignUp.handelOnchangeTf(textfield: textfield, lable: lbErrEmail)
    }
    @IBAction func tfOnchangePassword(_ sender: Any) {
        guard let textfield = sender as? UITextField else {return}
        self.presenterSignUp.handelOnchangeTf(textfield: textfield, lable: lbErrPassword)
    }
    //MARK: Handle create user
    @IBAction func onTapBtnConfirmsignup(_ sender: Any) {
        self.presenterSignUp.signUp(email: tfEmail.text!, password: tfPassword.text!, name: tfName.text!, numberPhone: tfNumberPhone.text!)
    }
}

extension SignUpController: PresenterSignUpDelegate {
    
    func signUpFailure(msg: String) {
        Dialog.showDialog(title: Resource.Text.sighUp, msg: msg, titleAction: Resource.Text.ok, target: self)
    }
    
    func signUpSuccess(msg: String) {
        Dialog.showDialog(title: Resource.Text.sighUp, msg: msg, titleAction: Resource.Text.ok, target: self)
    }
    func saveDataError(msg: String) {
        Dialog.showDialog(title: Resource.Text.sighUp, msg: msg, titleAction: Resource.Text.ok, target: self)
    }
    
    func nameIsEmpty(msg: String) {
        Validate.lbShowError(msg: msg, lable: lbErrName)
    }
    
    func numberPhongeIsEmpty(msg: String) {
        Validate.lbShowError(msg: msg, lable: lbErrNumberPhone)
    }
    func emailIsEmpty(msg: String) {
        Validate.lbShowError(msg: msg, lable: lbErrEmail)
    }
    func passwordIsEmpty(msg: String) {
        Validate.lbShowError(msg: msg, lable: lbErrPassword)
    }
    func passwordInvalid(msg: String) {
        Validate.lbShowError(msg: msg, lable: lbErrPassword)
      }
}
