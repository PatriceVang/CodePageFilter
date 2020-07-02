//
//  PageOneViewModel.swift
//  MVVMOne
//
//  Created by Apple on 6/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import RxSwift


protocol PageOneViewModeling {
    var isClearColor: PublishSubject<Bool> {get set}
    func OnChangeBackGroudColor(isChangColor: Bool)
}

class PageOneViewModel: PageOneViewModeling {
    func OnChangeBackGroudColor(isChangColor: Bool) {
        isClearColor.onNext(isChangColor)
    }
    var isClearColor: PublishSubject<Bool> = .init()
}
