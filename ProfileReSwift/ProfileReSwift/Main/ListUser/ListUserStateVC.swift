//
//  ListUserStateVC.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import ReSwift


struct ListUserStateVC {
    var list: [User] {
        return store.state.listUserState.listUser
    }
    func read(user: [User]) {
        store.dispatch(ListUserState.Read(user: user))
    }
    
    func delete(at index: Int) {
        store.dispatch(ListUserState.Delete(index: index))
    }
    
    func update(newUser: User) {
        store.dispatch(ListUserState.Update(user: newUser))
    }
    
    func add(user: User) {
        store.dispatch(ListUserState.Add(user: user))
    }
    
    
}
