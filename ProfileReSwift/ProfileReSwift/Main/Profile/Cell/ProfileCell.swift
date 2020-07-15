//
//  ProfileCell.swift
//  ProfileReSwift
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    lazy var arrowRightButton = UIButton(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        //-- ArrowRight Button
        contentView.addSubview(arrowRightButton)
        arrowRightButton.setImage(UIImage(named: "cheveron_right"), for: .normal)
        arrowRightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowRightButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowRightButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            arrowRightButton.heightAnchor.constraint(equalToConstant: 20),
            arrowRightButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
}
