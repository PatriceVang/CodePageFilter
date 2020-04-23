//
//  Presenter.swift
//  FashionApp
//
//  Created by Apple on 4/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


protocol PresenterDetailDelegate: class {
    
}

protocol PresenterDetailProtocol {
    var view: PresenterDetailDelegate? {get set}
    
}

class PresenterDetail: PresenterDetailProtocol {
    weak var view: PresenterDetailDelegate?
    
    
}


