//
//  LoginViewModel.swift
//  MVVMGoogleMap
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import RxSwift

class LoginViewModel {
    var email = PublishSubject<String?>()
    var password = PublishSubject<String?>()
    
    let didFailSignIn = PublishSubject<Error>()
    
    init() {
        
        
        
    }
    
    func signInTapped() {
        
        
    }
}
