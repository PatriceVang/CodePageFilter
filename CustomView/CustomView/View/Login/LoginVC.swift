//
//  LoginVC.swift
//  CustomView
//
//  Created by Apple on 4/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var emailView: TitleAndInput!
    @IBOutlet weak var passwordView: TitleAndInput!
    var presenter: PresenterProtocol
    
    init() {
        presenter = Presenter()
        super.init(nibName: "LoginVC", bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        customElement()
    }
    
    
    //MARK: CustomElement
    private func customElement() {
        emailView.setUpViewLb(title: "Email")
        emailView.setUpViewTf(placeHolder: "email@gmail.com", radius: 15)
        passwordView.setUpViewLb(title: "Password")
        passwordView.setUpViewTf(placeHolder: "123123", radius: 15)
    }
    
    @IBAction func confirmBtn(_ sender: Any) {
        self.presenter.getData(email: (emailView.inputTF.text?.trimmingCharacters(in: .whitespacesAndNewlines))!, password: (passwordView.inputTF.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    }
}
extension LoginVC: PresenterDelegate {
    func passData(token: String) {
        UserDefaults.standard.set(token, forKey: "token")
    }
}
