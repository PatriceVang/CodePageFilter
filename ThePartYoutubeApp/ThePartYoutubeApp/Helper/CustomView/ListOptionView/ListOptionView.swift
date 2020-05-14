//
//  ListOptionView.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit




class ListOptionView: BaseViewXib {
    
//    @IBOutlet weak var stV: UIView!
    @IBOutlet weak var stackV: UIStackView!
    var delegate: ListOptionViewDelegate?
    
    override func initView() {
        
    }
    
    convenience init(types: [OptionType]) {
        self.init(frame: .zero)
        self.backgroundColor = .white
        let listOptionV = types.map { StackViewHor(type: $0)}
        listOptionV.forEach { (stV) in
            stackV.addArrangedSubview(stV)
            stV.isUserInteractionEnabled = true
            stV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapOptineType(_:))))
        }
        backgroundColor = .green
    }
    
    @objc func onTapOptineType(_ sender: UITapGestureRecognizer) {
        guard let opView = sender.view as? StackViewHor else {return}
        delegate?.onTapOptionType(type: opView.opType)
    }
}

protocol ListOptionViewDelegate {
    func onTapOptionType(type: OptionType)
}


