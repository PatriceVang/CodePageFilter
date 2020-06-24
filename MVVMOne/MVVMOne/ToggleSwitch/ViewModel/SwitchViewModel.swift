//
//  SwitchViewModel.swift
//  MVVMOne
//
//  Created by Apple on 6/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


class SwitchViewModel {
    
    var isOn: Bool = false
    
    var isOnApi: Bool = false
    
    init() {
        self.isOn = false
    }
    
    
    
    func onChangeStateSwitch() -> Bool {
        
        isOnApi = !isOnApi
        
        isOn = isOnApi
        
        return isOn
    }
    
    
}
