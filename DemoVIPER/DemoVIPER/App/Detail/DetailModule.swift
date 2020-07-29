//
//  DetailModule.swift
//  DemoVIPER
//
//  Created by Apple on 7/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


protocol DetailViewToPresenter {
    
    var view: DetailPresenterToView? {get set}
    var interactor: DetailPresenterToInterActor? {get set}
    var route: DetailPresenterToRouter? {get set}
    
    func startGetData()
}

protocol DetailPresenterToView {
    func showData()
}

protocol DetailPresenterToInterActor {
    var presenter: DetailInteractorToPresenter? {get set}
    func getData()
}

protocol DetailInteractorToPresenter {
    func getDataSuccess()
    func getDataFail()
}

protocol DetailPresenterToRouter {
    static func createRouter() -> DetailVC
}
