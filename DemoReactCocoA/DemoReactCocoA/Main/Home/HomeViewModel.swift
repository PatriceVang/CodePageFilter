//
//  HomeViewModel.swift
//  DemoReactCocoA
//
//  Created by Apple on 7/21/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift
import Moya

protocol HomeViewModelProtocol {
    var user: MutableProperty<User> {get}
    var createUserAction: Action<Any, Response, MoyaError> {get}
    var inputName: MutableProperty<String> {get}
    var inputIsValid: MutableProperty<Bool> {get set}
    var msgError: MutableProperty<String> {get set}
    init()
}

class HomeViewModel: HomeViewModelProtocol {
    
    var msgError: MutableProperty<String> = MutableProperty<String>("")
    
    var inputIsValid: MutableProperty<Bool> = MutableProperty<Bool>(false)
    
    var inputName: MutableProperty<String> = MutableProperty<String>("")
    
    var user: MutableProperty<User> = MutableProperty<User>(User())
    
    lazy var createUserAction: Action<Any, Response, MoyaError> = Action(state: self.inputIsValid, enabledIf: { (_) in
        return self.inputIsValid.value
    }) { (_, _)  in
        return self.executeCreateUser()
    }
    
    required init() {
        
        self.msgError <~ inputName.producer.map({ (str) in
            if str.isEmpty {
                return "Please fill in Name"
            }
            return ""
        })
        
        self.inputIsValid <~ msgError.producer.map({ str in
            return str.isEmpty
        })

        
        self.createUserAction.events.observeValues { (events: Signal<Response, MoyaError>.Event) in
            switch events {
            case .value(let response):
                if let user = try? JSONDecoder().decode(User.self, from: response.data) {
                    self.user.value = user
                }
            case .failed(let err):
                print(err.localizedDescription)
            default:
                break
            }
        }
    }
    
    func executeCreateUser() -> SignalProducer<Response, MoyaError> {
        return UserProvider.reactive.request(APIUser.postUser(params: self.inputName.value))
    }
    
    
}
