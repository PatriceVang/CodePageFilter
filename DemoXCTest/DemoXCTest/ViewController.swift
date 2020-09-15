//
//  ViewController.swift
//  DemoXCTest
//
//  Created by Apple on 9/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        print(2.square())

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


