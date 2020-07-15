//
//  InfomationHeader.swift
//  ProfileReSwift
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import UIKit

class InfomationHeader: UIView {
    
    let stackView = UIStackView()

    lazy var nameLable = UILabel()
    lazy var emailLable = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = #colorLiteral(red: 0.9488552213, green: 0.9487094283, blue: 0.9693081975, alpha: 1)

        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        stackView.addArrangedSubview(nameLable)
        stackView.addArrangedSubview(emailLable)
    }

}

