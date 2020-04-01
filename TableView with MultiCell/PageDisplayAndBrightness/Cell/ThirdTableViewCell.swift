//
//  ThirdTableViewCell.swift
//  PageDisplayAndBrightness
//
//  Created by Apple on 3/31/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {

    @IBOutlet weak var lbOption: UILabel!
    
    @IBAction func btnRight(_ sender: Any) {
    }
    @IBOutlet weak var lbResultOption: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
