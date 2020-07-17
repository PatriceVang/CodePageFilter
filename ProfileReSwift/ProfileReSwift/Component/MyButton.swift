//
//  MyButton.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import UIKit

enum ButtonSlyte {
    case normal
}

class MyButton: UIButton {
    
    var selectedImg: UIImage?
    var unSelectedImg: UIImage?
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(selected: UIImage? = nil, unSelected: UIImage? = nil) {
        self.init(frame: .zero)
        self.selectedImg = selected
        self.unSelectedImg = unSelected

        setImage(selected, for: .selected)
        setImage(unSelected, for: .normal)
        addTarget(self, action: #selector(onChangeSelecte(_:)), for: .touchUpInside)
    }
    
    @objc func onChangeSelecte(_ sender: UIButton) {
        isSelected = !sender.isSelected
    }
}
