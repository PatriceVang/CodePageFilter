//
//  ExtensionSetImage.swift
//  FashionApp
//
//  Created by Apple on 4/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


extension UIImageView {
        
    
    func setImage(url: String) {
        guard let url = URL(string: url) else {return}
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil, completionHandler: nil)
    }
}
