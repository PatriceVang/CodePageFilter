//
//  ModuleProtocol.swift
//  DemoVIPER
//
//  Created by Apple on 7/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit



// Presenter
protocol UserPresenterProtocol: class {
    // action from view
    func getUser()

    func moveToDetail()
}

// Interactor

protocol UserInteractorProtocol: class {
    func fetchData()
}

protocol UserInteractorOutputProtocol: class {
    func didSuccess(user: [User])
    func didFail(err: String?)
}

// Router
protocol UserRouterProtocol: class {
    func moveToDetailVC()
}

// View
protocol UserViewProtocol: class {
    func showUser(user: [User])
}


