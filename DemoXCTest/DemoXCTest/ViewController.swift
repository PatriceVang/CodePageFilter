//
//  ViewController.swift
//  DemoXCTest
//
//  Created by Apple on 9/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var a: Int?
    
    var number: Int? {
        get {
            return number
        }
        
        set {
            self.a = newValue
        }
    }
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(2.square())
        number = 6
        
        print(number)
        
        

    }
    


}

extension Int {
    func square() -> Int {
        return self * self
    }
    
    
    func checkNumberChan() -> ResultNumber {
        if self % 2 == 0 {
            return .sochan
        } else {
            return .sole
        }
    }
}


enum ResultNumber {
    case sochan
    case sole
}


