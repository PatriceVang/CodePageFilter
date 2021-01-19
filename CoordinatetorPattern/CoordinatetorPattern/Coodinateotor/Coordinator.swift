//
//  Coordinator.swift
//  CoordinatetorPattern
//
//  Created by Apple on 1/9/21.
//  Copyright © 2021 vinova. All rights reserved.
//

import Foundation
import UIKit


enum EventType {
    case tap
}

protocol Coordinator {
    var navigation: UINavigationController? {get set}
    func eventOccured(_ type: EventType)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? {get set}
}

class MainCoordinator: Coordinator {
   
    
    var navigation: UINavigationController?
    
    func eventOccured(_ is: EventType) {
           
    }
    
    func start() {
        
    }
    
    
}
