//
//  HomeStateController.swift
//  DemoRedux
//
//  Created by Apple on 7/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


struct HomeStateController {
    
    
    var counter: Int {
        return store.state.homeState.counter
    }
    
    var displayTitle: DisplayTitleState {
        return store.state.homeState.displayTitle
    }
    
    func displaytitle(title: String) {
        store.dispatch(DisplayTitleAction(text: title))
    }
    
    func numberIncrease() {
        store.dispatch(CounterActionIncreaseAction())
    }
    
    func numberDecrease() {
        store.dispatch(CounterActionDecreaseAction())
    }
    
    func allowedDisplayText(isAllowed: Bool) {
        store.dispatch(AllowDisplayText(isAllowed: isAllowed))
    }
}
