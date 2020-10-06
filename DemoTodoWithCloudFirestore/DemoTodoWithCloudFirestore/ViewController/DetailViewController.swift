//
//  DetailViewController.swift
//  DemoTodoWithCloudFirestore
//
//  Created by Apple on 10/5/20.
//

import Foundation
import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var user: User?
    
    let stackView: UIStackView = {
       let stV = UIStackView()
        stV.axis = .vertical
        stV.distribution = .fillEqually
        return stV
    }()
    
    let textfield: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Update name at here"
        tf.layer.borderWidth = 1
        return tf
    }()
    
    
    let okButton: UIButton = {
       let bt = UIButton()
        bt.setTitle("OK", for: .normal)
        bt.setTitleColor(.blue, for: .normal)
        return bt
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
            make.left.equalTo(self.view).offset(20)
            make.height.equalTo(100)
        }
        
        stackView.addArrangedSubview(textfield)
        stackView.addArrangedSubview(okButton)
        
        okButton.addTarget(self, action: #selector(onTapOKButton(_:)), for: .touchUpInside)
        
    }
    
    @objc func onTapOKButton(_ sender: UIButton) {
        if textfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            print("Let's fill in new name")
        }
        user?.name = textfield.text
        UserDB.shared.update(entity: user!)
    }
    
}
