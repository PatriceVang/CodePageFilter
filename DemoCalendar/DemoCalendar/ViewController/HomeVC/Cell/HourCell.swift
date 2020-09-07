//
//  HourCell.swift
//  DemoCalendar
//
//  Created by Apple on 9/7/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class HourCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.textLabel?.textAlignment = .center
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
