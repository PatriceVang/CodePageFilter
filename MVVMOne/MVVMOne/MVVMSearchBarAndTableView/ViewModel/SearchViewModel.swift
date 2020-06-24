//
//  SearchViewModel.swift
//  MVVMOne
//
//  Created by Apple on 6/3/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


class SearchViewModel {

    var inputText: Observable<String>?
    var result: Observable<[User]>?
    
    init() {
        self.inputText = Observable(value: "")
        self.result = Observable(value: [])
    }
    
    func fetchData() {
        let url = "https://api.github.com/search/users?q=\(inputText!.value)"
        
        APIService.shared.getMethodByAl(of: DataUser.self, url: url, params: nil, header: nil) { (data, err) in
            if err != nil {
                print(err?.localizedDescription as Any)
            } else {
                guard let data = data else {return}
                DispatchQueue.main.async {
                    self.result?.value = data.items
                }
            }
        }
    }
}
