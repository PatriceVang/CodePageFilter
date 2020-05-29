//
//  ViewModel.swift
//  MVVMGoogleMap
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper


class ViewModel {
    var searchId = PublishSubject<String?>()
    let dispose = DisposeBag()
    
    var name = PublishSubject<String?>()
    var id = PublishSubject<String?>()
    
    var user: User? {
        didSet {
            if let name = self.user?.name {
                DispatchQueue.main.async {
                    self.name.onNext(name)
                }
            }
            
            if let id = self.user?.id {
                DispatchQueue.main.async {
                    self.id.onNext("\(id)")
                }
            }
        }
    }
    
    init() {
        
        bindData()
    }
    
    
    func bindData() {
        let jsonRequest = searchId.map { text in
            return URLSession.shared.rx.json(url: URL(string: "https://api.github.com/search/users?q=\(text ?? "")")!)
        }.switchLatest()
            
        jsonRequest.subscribe(onNext: { (json) in
            let object = UserItems(JSON: json as! [String : Any])
            object.map { $0.items?.forEach { return self.user = $0}}
            print(self.user)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        
        
    }
    
    
}
