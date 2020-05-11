//
//  InfoHeader.swift
//  Twitter
//
//  Created by Apple on 5/10/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class InfoHeader: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
