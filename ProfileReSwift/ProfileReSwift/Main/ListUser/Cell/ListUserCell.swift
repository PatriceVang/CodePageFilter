//
//  ListUserCell.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ListUserCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
    }
    
    func setValue(user: User) {
        self.textLabel?.text = user.name
        
    }
}
