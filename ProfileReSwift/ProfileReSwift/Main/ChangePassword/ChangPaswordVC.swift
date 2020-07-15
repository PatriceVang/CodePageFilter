//
//  ChangPaswordVC.swift
//  ProfileReSwift
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ChangPaswordVC: UIViewController{

    lazy var currentPassword = TitleAndInput(textStyle: .confirmPassword, title: "CURRENT PASSWORD")
    lazy var newPassword = TitleAndInput(textStyle: .changePassword, title: "NEW PASSWORD")
    lazy var confirmPassword = TitleAndInput(textStyle: .confirmPassword, title: "CONFIRM NEW PASSWORD")
    lazy var showPasswordView = UIView()
    var showPasswordLable: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Show password"
        return lb
    }()
    lazy var onOffShowPasswordSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(currentPassword)
        currentPassword.delegate = self
        currentPassword.inputTextField.tag = 0
        NSLayoutConstraint.activate([
            currentPassword.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
            currentPassword.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            currentPassword.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            currentPassword.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        self.view.addSubview(newPassword)
        newPassword.delegate = self
        newPassword.inputTextField.tag = 1
        NSLayoutConstraint.activate([
            newPassword.topAnchor.constraint(equalTo: self.currentPassword.bottomAnchor, constant: 20),
            newPassword.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            newPassword.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            newPassword.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        self.view.addSubview(confirmPassword)
        confirmPassword.inputTextField.tag = 2
        confirmPassword.delegate = self
        NSLayoutConstraint.activate([
            confirmPassword.topAnchor.constraint(equalTo: self.newPassword.bottomAnchor, constant: 20),
            confirmPassword.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            confirmPassword.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            confirmPassword.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        
        self.view.addSubview(showPasswordView)
        showPasswordLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showPasswordView.topAnchor.constraint(equalTo: confirmPassword.bottomAnchor, constant: 20),
            showPasswordView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            showPasswordView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            showPasswordView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        showPasswordView.addSubview(showPasswordLable)
        showPasswordView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showPasswordLable.centerYAnchor.constraint(equalTo: showPasswordView.centerYAnchor),
            showPasswordLable.leadingAnchor.constraint(equalTo: showPasswordView.leadingAnchor),
            showPasswordLable.heightAnchor.constraint(equalToConstant: 30),
            showPasswordLable.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        showPasswordView.addSubview(onOffShowPasswordSwitch)
        onOffShowPasswordSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            onOffShowPasswordSwitch.centerYAnchor.constraint(equalTo: self.showPasswordView.centerYAnchor),
            onOffShowPasswordSwitch.trailingAnchor.constraint(equalTo: showPasswordView.trailingAnchor),
            onOffShowPasswordSwitch.heightAnchor.constraint(equalToConstant: 20),
            onOffShowPasswordSwitch.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
}

extension ChangPaswordVC: TitleAndInputDelegate {
    func onTapTitleAndInput(text: String, textField: UITextField) {

//        let nextTag = textField.tag + 1
//        print(nextTag)
//        if let nextTf = textField.superview?.viewWithTag(nextTag) as? UITextField {
//            nextTf.becomeFirstResponder()
//
//        } else {
//            textField.resignFirstResponder()
//        }
        
        switch textField {
        case self.currentPassword.inputTextField:
            self.newPassword.inputTextField.becomeFirstResponder()
        case self.newPassword.inputTextField:
            self.confirmPassword.inputTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
    }
    

}
