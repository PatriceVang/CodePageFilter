//
//  UserCell.swift
//  DemoReactCocoA
//
//  Created by Apple on 7/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setValue(user: User) {
        self.textLabel?.text = user.name
    }
}
