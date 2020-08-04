//
//  MyButton.swift
//  DemoVIPER
//
//  Created by Apple on 8/4/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


class MyButton: UIButton {
    
    
    
    var unSelectedImg: UIImage?
    var selectedImg: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    convenience init(selected: UIImage? = nil, unSelected: UIImage? = nil) {
        self.init(frame: .zero)
        self.selectedImg = selected
        self.unSelectedImg = unSelected

        setImage(selected, for: .selected)
        setImage(unSelected, for: .normal)
        
        self.addTarget(self, action: #selector(onTapMyButton(_:)), for: .touchUpInside)
    }
    
    @objc func onTapMyButton(_ sender: UIButton) {
        isSelected = !sender.isSelected
    }
    
    required init?(coder: NSCoder) {
//        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
    }

}



