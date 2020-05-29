//
//  HomeVC.swift
//  MVVMGoogleMap
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {
    
    
    let searchTf: UITextField = {
       let tf = UITextField()
        tf.backgroundColor = .lightGray
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let idLb: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    
    let nameLb: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    
    
    let dispose = DisposeBag()
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(searchTf)
        NSLayoutConstraint.activate([
            searchTf.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            searchTf.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            searchTf.heightAnchor.constraint(equalToConstant: 50),
            searchTf.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        self.view.addSubview(idLb)
        NSLayoutConstraint.activate([
            idLb.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            idLb.topAnchor.constraint(equalTo: searchTf.bottomAnchor, constant: 10),
        ])
        
        self.view.addSubview(nameLb)
        NSLayoutConstraint.activate([
            nameLb.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            nameLb.topAnchor.constraint(equalTo: idLb.bottomAnchor, constant: 10),
        ])

    }
    
    
    func bindingUI()  {
        viewModel.name.bind(to: nameLb.rx.text).disposed(by:dispose)
        viewModel.id.bind(to: idLb.rx.text).disposed(by: dispose)
        
        
    }
    


}
