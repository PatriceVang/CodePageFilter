//
//  DetailStateController.swift
//  DemoRedux
//
//  Created by Apple on 7/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


struct DetailStateController {
    
    var title: UpdateState {
        return store.state.detailState.updateState
    }
    
    func updateTitle(title: String) {
        store.dispatch(UpdateTitleAction(title: title))
    }
    
    
}
