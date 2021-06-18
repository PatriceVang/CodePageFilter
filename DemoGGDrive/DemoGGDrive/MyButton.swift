//
//  MyButton.swift
//  DemoGGDrive
//
//  Created by Apple on 5/28/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import UIKit

class MyButton: UIButton {
    
    private let seletedImage = UIImage(named: "1")
    private let unSelectedImage = UIImage(named: "0")
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        self.setImage(seletedImage, for: .selected)
        self.setImage(unSelectedImage, for: .normal)
        addTarget(self, action: #selector(reloadUI), for: .touchUpInside)
    }
    
    @objc func reloadUI() {
        self.isSelected.toggle()
        print(isSelected)
    }
    
}
