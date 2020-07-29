//
//  HomeVC.swift
//  DemoReactCocoA
//
//  Created by Apple on 7/21/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa
import PKHUD

class HomeVC: UIViewController {
    @IBOutlet weak var inputName_Tf: UITextField!
    @IBOutlet weak var displayName_Lb: UILabel!
    @IBOutlet weak var signIn_Btn: UIButton!
    var isLoginStudent: Bool = true
    @IBOutlet weak var moveToUser_Btn: UIButton!
    
    var student_Btn = MyButton(selected: UIImage(named: "selected_img"), unSelected: UIImage(named: "unSelected_img"))
    var staff_Btn = MyButton(selected: UIImage(named: "selected_img"), unSelected: UIImage(named: "unSelected_img"))

    let viewModel: HomeViewModelProtocol
    let createUserAction: CocoaAction<Any>
    init() {
        viewModel = HomeViewModel()
        createUserAction = CocoaAction(viewModel.createUserAction, {_ in return () })
        super.init(nibName: "HomeVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.inputName <~ inputName_Tf.reactive.continuousTextValues
        observerCreateUserAction()
        
        let stV = UIStackView()
        stV.translatesAutoresizingMaskIntoConstraints = false
        stV.axis = .horizontal
        stV.distribution = .equalCentering
        
        self.view.addSubview(stV)
        NSLayoutConstraint.activate([
            stV.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stV.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            stV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            stV.heightAnchor.constraint(equalToConstant: 50)
        ])
        stV.addArrangedSubview(student_Btn)
        stV.addArrangedSubview(staff_Btn)
        
        student_Btn.addTarget(self, action: #selector(onTapStudenBtn(_:)), for: .touchUpInside)
        staff_Btn.addTarget(self, action: #selector(onTapStaffBtn(_:)), for: .touchUpInside)
        
        student_Btn.isSelected = true
    }
    private func observerCreateUserAction() {
        createUserAction.isExecuting.signal.observeValues {[weak self] (done) in
            if done {
                HUD.flash(.progress, delay: 2)
            } else {
                self?.displayName_Lb.text = self?.viewModel.user.value.name
                HUD.hide()
            }
        }
    }
        
    @IBAction func onTapCreateUserBtn(_ sender: Any) {
        if viewModel.msgError.value.isEmpty {
               createUserAction.execute(self)
        }else {
            print(viewModel.msgError.value)
        }
    }

    @IBAction func onTapMoveToClient(_ sender: UIButton) {
        print("Move")
        self.navigationController?.pushViewController(UserVC(), animated: true)
    }
    
    @objc func onTapStudenBtn(_ sender: UIButton) {
        isLoginStudent.toggle()
        handelChangeStateBtn()
    }
    
    @objc func onTapStaffBtn(_ sender: UIButton) {
        isLoginStudent.toggle()
        handelChangeStateBtn()
    }
    
    private func handelChangeStateBtn() {
        student_Btn.isSelected = isLoginStudent == true ? true : false
        staff_Btn.isSelected = isLoginStudent == true ? false : true
        moveToUser_Btn.setTitle( isLoginStudent ? "Move to Student" : "Move to Staff", for: .normal)
    }

}
