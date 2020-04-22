//
//  Presenter.swift
//  CustomView
//
//  Created by Apple on 4/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


protocol PresenterDelegate: class {
    func passData(token: String)
}

protocol PresenterProtocol {
    var view: PresenterDelegate? {get set}
    func getData(email: String, password: String)
    
}

class Presenter: PresenterProtocol {
    weak var view: PresenterDelegate?
    func getData(email: String, password: String) {
        let url = "https://khind.vinova.sg/auth/sign_in"
        APICaller.otherMethod(url: url, header: nil, param: ["email": email, "password": password], T: Object.self) { (object, err) in
            guard let object = object else {return}
            guard let token = object.user?.token?.token else {return}
            print(token)
            DispatchQueue.main.async {
                self.view?.passData(token: token)
            }
        }
    }
    
}
