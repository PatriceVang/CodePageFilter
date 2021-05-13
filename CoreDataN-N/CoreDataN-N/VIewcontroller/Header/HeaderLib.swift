//
//  HeaderLib.swift
//  CoreDataN-N
//
//  Created by Apple on 5/13/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import UIKit

class HeaderLib: UIView {
    var completion: (() -> Void)?
    
    private let lbTile: UILabel = {
       let lb = UILabel()
        lb.textAlignment = .center
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        
        addSubview(lbTile)
        lbTile.frame = bounds
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapMySelf)))
        
    }
    
    @objc func onTapMySelf() {
        completion?()
    }
    
    func setTitle(_ text: String) {
        lbTile.text = text
    }
}
