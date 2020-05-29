//
//  DetailVC.swift
//  DemoMVC
//
//  Created by Apple on 5/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    //MARK: Probertis
    let detailUserLb: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
 
    var user: User?
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
        detailUserLb.text = self.user?.name
    }

    private func setupView() {
        self.view.addSubview(detailUserLb)
        NSLayoutConstraint.activate([
            detailUserLb.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            detailUserLb.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}

