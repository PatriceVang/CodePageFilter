//
//  ViewModel.swift
//  MVVMOne
//
//  Created by Apple on 5/11/20.
//  Copyright © 2020 vinova. All rights reserved.
//





class HomeViewModel {
    let name: String?
    let address: String?
    var listUser: [User]
    
    //DI
    init(user: User) {
        self.name = user.name
        self.address = user.getAddress()
        self.listUser = []
    }
    
    func fetchData() {
        let url = "https://jsonplaceholder.typicode.com/users"
               APICaller.shared.getMethor([User].self, url: url, header: nil, params: nil) { (user, err) in
                   if err != nil {
                       print(err?.message as Any)
                   } else {
                    guard let listUser = user else {return}
                    
                    listUser.append(contentsOf: listUser.map {  })
                    for item in listUser {
                        self.listUser.append(.init(user: item))
                    }
                    
                }
            }
    }
    
    
}





