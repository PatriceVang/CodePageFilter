//
//  DetailCell.swift
//  MVCExpandTableView
//
//  Created by Apple on 6/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var titleLb: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
