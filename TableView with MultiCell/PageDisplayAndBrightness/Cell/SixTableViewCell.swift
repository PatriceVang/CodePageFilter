//
//  SixTableViewCell.swift
//  PageDisplayAndBrightness
//
//  Created by Apple on 3/31/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class SixTableViewCell: UITableViewCell {

    @IBOutlet weak var lbAutoClock: UILabel!
    
    @IBOutlet weak var lbMinute: UILabel!
    
    @IBAction func btnShowMinute(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
