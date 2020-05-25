//
//  TableViewCell.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/21/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    @IBOutlet weak var heightOfPresentImg: NSLayoutConstraint!
    
    @IBOutlet weak var subtitleLb: UILabel!
    @IBOutlet weak var authorLb: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var presentImg: UIImageView!
    var articles: Articles? {
        didSet {
            guard let url = self.articles?.image else {return}
            presentImg.setImage(url: url)
            titleLb.text = self.articles?.title
            authorLb.text = self.articles?.author
            subtitleLb.text = self.articles?.published
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        customElement()
    }
    private func customElement() {
        heightOfPresentImg.constant = contentView.frame.width / 2.5
    }
    
}
