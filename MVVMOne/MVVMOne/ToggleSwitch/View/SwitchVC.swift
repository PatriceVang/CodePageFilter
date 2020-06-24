//
//  SwitchVC.swift
//  MVVMOne
//
//  Created by Apple on 6/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class SwitchVC: UIViewController {
    let toggleBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("Toggle", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(onTapToggleBtn(_:)), for: .touchUpInside)
        return btn
    }()
    
    let switchBtn: UISwitch = {
        let btn = UISwitch()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    var viewModel = SwitchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(toggleBtn)
        self.view.addSubview(switchBtn)
        
        
        NSLayoutConstraint.activate([
            switchBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            switchBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            toggleBtn.topAnchor.constraint(equalTo: switchBtn.bottomAnchor, constant:  10),
            toggleBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        

    }
    
    
    @objc func onTapToggleBtn(_ sender: UIButton) {
        switchBtn.isOn = viewModel.onChangeStateSwitch()
    }
    
    
}
