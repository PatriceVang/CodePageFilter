//
//  UpdateUserVC.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class UpdateUserVC: UIViewController {
    
    let updateTextField = MyTextField(style: .confirmPassword)
    lazy var confirmButton = MyButton(selected: UIImage(named: "selected_img"), unSelected: UIImage(named: "unSelected_img"))
    let listUserStateVC: ListUserStateVC
    var user: User?

    init() {
        listUserStateVC = ListUserStateVC()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.title = "Update User"
        setupUI()
    }
    
    private func setupUI() {
        
        self.view.addSubview(updateTextField)
        updateTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            updateTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            updateTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            updateTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            updateTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        self.view.addSubview(confirmButton)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.addTarget(self, action: #selector(onTapConfirmButton(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: self.updateTextField.bottomAnchor, constant: 30),
            confirmButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: 150),
            confirmButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    //MARK:-- Handle Event
    @objc func onTapConfirmButton(_ sender: UIButton) {
        user?.name = updateTextField.text
        listUserStateVC.update(newUser: user ?? User())
    }
}
