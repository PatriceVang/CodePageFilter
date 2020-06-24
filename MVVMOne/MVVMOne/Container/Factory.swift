//
//  Factory.swift
//  MVVMOne
//
//  Created by Apple on 6/5/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


typealias Factory = ViewControllerFactory & ViewModelFactory

protocol ViewControllerFactory {
    func makeSearchController() -> SearchVC
    func makeHomeVC() -> HomeVC
}

protocol ViewModelFactory {
    func makeHomeViewModel() -> HomeViewModel
    func makeSearchViewModel() -> SearchViewModel
}

class DependenciesContainer {
//    private lazy var searchViewModel = SearchViewModel()
}


// create ViewController
extension DependenciesContainer: ViewControllerFactory {
    func makeSearchController() -> SearchVC {
        return SearchVC(factory: self)
    }
    
    func makeHomeVC() -> HomeVC {
        return HomeVC()
    }

}


//create ViewModel
extension DependenciesContainer: ViewModelFactory {
    func makeSearchViewModel() -> SearchViewModel {
        return SearchViewModel()
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel()
    }
}






