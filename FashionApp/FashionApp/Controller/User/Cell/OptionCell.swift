//
//  MyCellUser.swift
//  FashionApp
//
//  Created by Apple on 5/4/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class OptionCell: UITableViewCell {
    @IBOutlet weak var presentImg: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    var model: Settings? {
        didSet {
            presentImg.image = UIImage(named: (self.model?.image)!)
            titleLb.text = self.model?.title
        }
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
