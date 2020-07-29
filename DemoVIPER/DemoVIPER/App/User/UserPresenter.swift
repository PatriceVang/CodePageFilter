//
//  FruitPresenter.swift
//  DemoVIPER
//
//  Created by Apple on 7/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


class UserPresenter {
    
           
    weak var view: UserViewProtocol?
    var interactor: UserInteractorProtocol?
    private var router: UserRouterProtocol
    init(router: UserRouterProtocol, interactor: UserInteractorProtocol, view: UserViewProtocol) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
}
extension UserPresenter: UserPresenterProtocol {


    func getUser() {
        interactor?.fetchData()
    }
    
    func moveToDetail() {
        router.moveToDetailVC()
    }
    
    
}

extension UserPresenter: UserInteractorOutputProtocol {
    func didSuccess(user: [User]) {
        view?.showUser(user: user)
    }
    
    func didFail(err: String?) {
        print("Error")
    }

}
