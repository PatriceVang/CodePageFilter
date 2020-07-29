//
//  Router.swift
//  DemoVIPER
//
//  Created by Apple on 7/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit



class UserRouter: UserRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = UserVC(nibName: nil, bundle: nil)
        
        let interactor = UserInteractor()
        let router = UserRouter()
        let presenter  = UserPresenter(router: router, interactor: interactor, view: view)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func moveToDetailVC() {
        viewController?.navigationController?.pushViewController(DetailVC(), animated: true)
    }

}
