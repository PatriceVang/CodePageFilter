//
//  MyCell.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(item: Any) {
        if let user = item as? User {
            self.textLabel?.text = user.name
        } else if let todo = item as? Todo {
            self.textLabel?.text = todo.title
        }
    }
}

    
