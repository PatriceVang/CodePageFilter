//
//  MyCell.swift
//  CoreDataCRUD
//
//  Created by Apple on 6/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet weak var name_Lb: UILabel!
    @IBOutlet weak var address_Lb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
