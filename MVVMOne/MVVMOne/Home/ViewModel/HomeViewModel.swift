//
//  ViewModel.swift
//  MVVMOne
//
//  Created by Apple on 5/11/20.
//  Copyright © 2020 vinova. All rights reserved.
//

protocol HomeViewModelDelegate: class {
    func didSuccess()
}


class HomeViewModel {

    let name: String? = nil
    let address: String? = nil
    var listUser: [User]?
    weak var delegate:HomeViewModelDelegate?

    
    //DI
//    init(user: User) {
//        self.name = user.name
////        self.address = user.getAddress()
//        self.listUser = []
//    }
    
    func fetchData() {
//        let url = "https://jsonplaceholder.typicode.com/users"
//               APICaller.shared.getMethor([User].self, url: url, header: nil, params: nil) { (user, err) in
//                   if err != nil {
//                       print(err?.message as Any)
//                   } else {
//                    guard let listUserNew = user else {return}
//                    self.listUser = listUserNew
//                    self.delegate?.didSuccess()
//                }
//            }
    }
    
    
}





