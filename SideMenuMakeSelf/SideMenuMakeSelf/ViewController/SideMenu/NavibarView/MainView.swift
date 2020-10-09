//
//  NavibarView.swift
//  SideMenuMakeSelf
//
//  Created by Apple on 10/9/20.
//

import Foundation
import UIKit



class MainView: UIView {
    
    
    
    let leftLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Menu"
        lb.textColor = .systemBlue
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(leftLabel)
        
        NSLayoutConstraint.activate([
            leftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            leftLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ])

        
        
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
        self.layer.masksToBounds = false
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}


