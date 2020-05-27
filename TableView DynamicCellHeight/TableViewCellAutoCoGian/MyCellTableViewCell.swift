//
//  MyCellTableViewCell.swift
//  TableViewCellAutoCoGian
//
//  Created by Apple on 3/31/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class MyCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lbText: UILabel!
    @IBOutlet weak var presentImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

}
