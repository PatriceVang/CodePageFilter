//
//  UserViewModel.swift
//  DemoReactCocoA
//
//  Created by Apple on 7/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift
import Moya
import SwiftyJSON

protocol UserViewModelProtocol {
    var listUser: MutableProperty<[User]> {get}
    var getUSerAction: Action<Any, Response, MoyaError> {get}
    var indexUser: MutableProperty<Int> {get}
    var newName: MutableProperty<String> {get}
    var updateUserAction: Action<Any, Int, MoyaError> {get}
    var msgErr: MutableProperty<String> {get}
    init()
}

class UserViewModel: UserViewModelProtocol {
    var msgErr: MutableProperty<String> = MutableProperty<String>("")
    
    var newName: MutableProperty<String> = MutableProperty<String>("titleDialog")
    
    var indexUser: MutableProperty<Int> = MutableProperty<Int>(0)
    
    var listUser: MutableProperty<[User]> = MutableProperty<[User]>([])

    
    lazy var getUSerAction: Action<Any, Response, MoyaError> = Action { (_)  in
        return self.executeGetUser()
    }
    //UPdate
    lazy var updateUserAction: Action<Any, Int, MoyaError> = Action { (_)  in
        return self.updateNameOfUser(indexUser: self.indexUser.value)
    }
    
    required init() {
        
        self.getUSerAction.events.observeValues { (event: Signal<Response, MoyaError>.Event) in
            switch event {
            case .value(let response):
                if let user = try? JSONDecoder().decode([User].self, from: response.data) {
                    self.listUser.value = user
                }
            case .failed(let err):
                print(err.localizedDescription)
            default:
                break
            }
        }
        

        self.msgErr <~ newName.producer.map({ (str)  in
            if str.isEmpty {
                return "Name is empty"
            }
            return ""
        })

        //Update
        self.updateUserAction.events.observeValues { (event: Signal<Int, MoyaError>.Event) in
            switch event {
            case .value(let index):
                self.listUser.value[index].name = self.newName.value
            case .failed(let err):
                print(err.localizedDescription)
            default:
                break
            }
        }
    }
    
    func executeGetUser() -> SignalProducer<Response, MoyaError> {
        let a = UserProvider.reactive.request(APIUser.getUser)
        return a
    }
    
    func updateNameOfUser(indexUser: Int) -> SignalProducer<Int, MoyaError> {
        return SignalProducer<Int, MoyaError> { obs, timelife in
            obs.send(value: indexUser)
            obs.sendCompleted()
        }
    }

}

