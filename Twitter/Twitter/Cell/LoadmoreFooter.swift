//
//  LoadmoreFooter.swift
//  Twitter
//
//  Created by Apple on 5/10/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class LoadmoreFooter: UICollectionReusableView {
    let indicator: UIActivityIndicatorView = {
        let ind = UIActivityIndicatorView(style: .large)
        ind.startAnimating()
        return ind
    }()
    var isHideIndicator: Bool?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBlue
        self.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


    
   
    
   
    

