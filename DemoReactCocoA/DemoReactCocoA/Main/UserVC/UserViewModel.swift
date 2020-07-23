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
    init()
}

class UserViewModel: UserViewModelProtocol {
    lazy var getUSerAction: Action<Any, Response, MoyaError> = Action { (_)  in
        return self.executeGetUser()
    }
    var listUser: MutableProperty<[User]> = MutableProperty<[User]>([])

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
    }
    
    func executeGetUser() -> SignalProducer<Response, MoyaError> {
        return UserProvider.reactive.request(APIUser.getUser)
    }

}

