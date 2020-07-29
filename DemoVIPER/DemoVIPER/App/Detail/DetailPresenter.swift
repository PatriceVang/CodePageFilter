//
//  DetailPresenter.swift
//  DemoVIPER
//
//  Created by Apple on 7/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation



class DetailPresenter: DetailViewToPresenter {
    
    
    var view: DetailPresenterToView?
    
    var interactor: DetailPresenterToInterActor?
    
    var route: DetailPresenterToRouter?
    
    func startGetData() {
        
    }
}

extension DetailPresenter: DetailInteractorToPresenter {
    func getDataSuccess() {
        
    }
    
    func getDataFail() {
        
    }
    
    
}
