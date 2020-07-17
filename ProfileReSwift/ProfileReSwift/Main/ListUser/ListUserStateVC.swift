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
    
    var listSelectedUser: [User] {
        return store.state.listUserState.selectedUser
    }
    
    var isShowedSelectItems: Bool {
        return store.state.listUserState.isShowSelecteItems
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
    
    func filter(name: String) {
        let newListUser = list.filter {($0.name?.contains(name))!}
        store.dispatch(ListUserState.Filter(newListUser: newListUser))
    }
    
    func isShowSelectItems() {
        store.dispatch(ListUserState.ShowSelecteItems())
    }

    func isSeletedItems(userIndex: Int) {
        store.dispatch(ListUserState.IsSelectedItems(userIndex: userIndex))
    }
    
    func isDeletedItems() {
        store.dispatch(ListUserState.IsDeletedItems())
    }
}
