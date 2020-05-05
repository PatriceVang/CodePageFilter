//
//  PresenterUser.swift
//  FashionApp
//
//  Created by Apple on 5/3/20.
//  Copyright © 2020 vinova. All rights reserved.
//

//import UIKit
import Foundation
import ObjectMapper
typealias JSON = [String: Any]
//cheking validate, network,...



protocol PresenterUserDelegate: class {
    func passData(data: [Settings])
}

protocol PresenterUserProtocol {
    var view: PresenterUserDelegate? {get set}
    func fetchData()
}

extension UserController {
    class Presenter: PresenterUserProtocol {

        var view: PresenterUserDelegate?
        func fetchData() {
            guard let data = try? JSONSerialization.jsonObject(with: data_, options: .mutableContainers)  else {return}
            let settings = Mapper<Settings>().mapArray(JSONArray: data as! [JSON])
            self.view?.passData(data: settings)
        }
    }
}



