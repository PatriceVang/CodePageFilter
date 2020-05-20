//
//  DetailUtityCell.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class DetailUtityCell: UICollectionViewCell {
    @IBOutlet weak var presentImg: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var authorLb: UILabel!
    @IBOutlet weak var subTitleLb: UILabel!
    
    var articles: Articles? {
        didSet {
            guard let url = self.articles?.image else {return}
            presentImg.setImage(url: url)
            titleLb.text = self.articles?.title
            authorLb.text = self.articles?.author ?? "Anonymous"
            subTitleLb.text = self.articles?.published
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
