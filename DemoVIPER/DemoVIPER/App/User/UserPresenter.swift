//
//  FruitPresenter.swift
//  DemoVIPER
//
//  Created by Apple on 7/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


class UserPresenter {
    
    var isAlowed = false
    
    var listUserTemp = [User]()
    
    var listUserSelescted = [User]()
    
    
    
    
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
    
    func handleSelectedUser(index: Int, isSelected: Bool) {
        
        listUserTemp[index].isSelected = !listUserTemp[index].isSelected!
        if listUserTemp[index].isSelected! {
            listUserSelescted.append(listUserTemp[index])
        } else {
            listUserSelescted = listUserSelescted.filter({ (user)  in
                return user.id != listUserTemp[index].id
            })
        }
        print(listUserSelescted)
        
    }

    func allowMultiple() {
        isAlowed.toggle()
        view?.showMultiple(isAllowed: isAlowed)
    }

    func getUser() {
        interactor?.fetchData()
    }
    
    func moveToDetail() {
        router.moveToDetailVC()
    }
    
    
}

extension UserPresenter: UserInteractorOutputProtocol {
    func didSuccess(user: [User]) {
        for item in user {
            let newUser = User(id: item.id, name: item.name, isSelected: false)
            listUserTemp.append(newUser)
        }
        
        view?.showUser(user: listUserTemp)
        
    }
    
    func didFail(err: String?) {
        print("Error")
    }

}
