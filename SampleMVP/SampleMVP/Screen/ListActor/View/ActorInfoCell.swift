//
//  ActorInfoCell.swift
//  SampleMVP
//
//  Created by Vinova Dev on 4/15/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import UIKit

class ActorInfoCell: UITableViewCell {
    
    @IBOutlet weak var avatarImgV: UIImageView!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var popularityLb: UILabel!
    
    var model: ActorResponse? {
        didSet {
            guard let model = self.model else { return }
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: URL(string: model.avatarUrl)!),
                    let img = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.avatarImgV.image = img
                    }
                }
            }
            nameLb.text = model.name
            popularityLb.text = "\(model.popularity)"
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
