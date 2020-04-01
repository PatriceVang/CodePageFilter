//
//  FourTableViewCell.swift
//  PageDisplayAndBrightness
//
//  Created by Apple on 3/31/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class FourTableViewCell: UITableViewCell {

    
    @IBOutlet weak var sldDuringLight: UISlider!
 
    @IBOutlet weak var lbSmallLight: UILabel!
    @IBOutlet weak var lbLargeLight: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
