//
//  Presenter.swift
//  SampleMVP
//
//  Created by Vinova Dev on 4/15/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import Foundation

protocol MainViewProtocol: class {
    
}

protocol MainPresenterProtocol: class {
    var view: MainViewProtocol { get set }
}


extension MainVC {
    class MainPresenter: MainPresenterProtocol {
        var view: MainViewProtocol
        
        
    }
}
