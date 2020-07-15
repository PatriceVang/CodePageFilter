//
//  WebVC.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {
    
    let str: String
    let webV = WKWebView()
    
    init(str: String) {
        self.str = str
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    
        guard let url = URL(string: str) else {return}
        let request = URLRequest(url: url)
        self.view.addSubview(webV)
        webV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webV.topAnchor.constraint(equalTo: self.view.topAnchor),
            webV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            webV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        webV.load(request)

    }

}
