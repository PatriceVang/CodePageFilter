//
//  ItemsCell.swift
//  DemoDragItemsTableView
//
//  Created by Apple on 8/26/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ItemsCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
    func setupValue(content: String) {
        self.textLabel?.text = content
    }
    
}
