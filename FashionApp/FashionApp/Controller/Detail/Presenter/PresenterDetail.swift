//
//  Presenter.swift
//  FashionApp
//
//  Created by Apple on 4/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

protocol PresenterDetailDelegate: class {
    func passColorData(color: String, index: Int)
    func passSizeData(title: String, index: Int)
    func passCountingData(count: Int)
}

protocol PresenterDetailProtocol {
    var view: PresenterDetailDelegate? {get set}
    func chosenColor(index: Int)
    func chosenSize(index: Int, arrBtn: [UIButton])
    func incrementCount(count: Int)
    func decrementCount(count: Int)
}

class PresenterDetail: PresenterDetailProtocol {
    //MARK: Probertis
    weak var view: PresenterDetailDelegate?
    //MARK: Handle Data
    // chosen quantity
    func decrementCount(count: Int) {
        var countNew = count
        if countNew == 1 {
            countNew = 1
        }else {
            countNew -= 1
        }
        self.view?.passCountingData(count: countNew)
    }

    func incrementCount(count: Int) {
        var countNew = count
        countNew += 1
        self.view?.passCountingData(count: countNew)
    }
    // Chosen size and color
    func chosenSize(index: Int, arrBtn: [UIButton]) {
        let title = arrBtn[index].currentTitle
        self.view?.passSizeData(title: title!, index: index)
    }
    func chosenColor(index: Int) {
        var color: String {
            switch index {
            case 0:
                return "Red"
            case 1:
                return "Black"
            case 2:
                return "Yellow"
            case 3:
                return "Gray"
            default:
                return ""
            }
        }
        self.view?.passColorData(color: color, index: index)
    }
}


