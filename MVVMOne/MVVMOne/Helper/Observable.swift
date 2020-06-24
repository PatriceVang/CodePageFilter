//
//  Observable.swift
//  MVVMOne
//
//  Created by Apple on 6/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation





class Observable<T> {
    
    typealias Observable = (T) -> Void
    
    
    var value: T {
        didSet {
            observable?(value)
        }
    }
    var observable: Observable?
    
    
    
    init(value: T) {
        self.value = value
    }
    
    
    
    func bindAndFire(observable: @escaping Observable)  {
        self.observable = observable
        observable(value)
    }
    
}




