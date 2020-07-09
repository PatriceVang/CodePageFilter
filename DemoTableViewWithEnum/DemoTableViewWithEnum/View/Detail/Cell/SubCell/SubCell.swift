//
//  SubCell.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/9/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class SubCell: UITableViewCell {
    @IBOutlet weak var titleLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setValue(item: User) {
        titleLb.text = item.name
    }
}
