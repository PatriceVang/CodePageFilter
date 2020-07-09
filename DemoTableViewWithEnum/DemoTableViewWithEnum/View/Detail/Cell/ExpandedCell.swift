//
//  ExpandedCell.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/9/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ExpandedCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValue(item: Any) {
        if let actor = item as? Actor {
            self.textLabel?.text = actor.name
        } else if let author = item as? Author {
            self.textLabel?.text = author.name
        }
    }
    
}
