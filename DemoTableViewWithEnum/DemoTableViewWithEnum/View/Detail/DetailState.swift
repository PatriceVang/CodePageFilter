//
//  DetailState.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/9/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation



struct DetailStateVC {
    var list: [People] {
        return store.state.peopleState.list
    }
    
    func showPeople(number: Int, list: [User]) {
        store.dispatch(ShowPeople.init(number: number, list: list))
    }
    
    func hidePeople(number: Int) {
        store.dispatch(HidePeople(number: number))
    }
}
