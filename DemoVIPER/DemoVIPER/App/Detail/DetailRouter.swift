//
//  DetailRouter.swift
//  DemoVIPER
//
//  Created by Apple on 7/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


class DetailRouter: DetailPresenterToRouter {
    static func createRouter() -> DetailVC {
        let view = DetailVC(nibName: "DetailVC", bundle: nil)
        var presenter: DetailViewToPresenter & DetailInteractorToPresenter = DetailPresenter()
        var interactor: DetailPresenterToInterActor = DetailInteractor()
        let router: DetailPresenterToRouter = DetailRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.route = router
        
        interactor.presenter = presenter
        
        return view
        
    }
    

}
