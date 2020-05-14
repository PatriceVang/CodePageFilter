//
//  ItemsVideoCellHome.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ItemsVideoCellHome: UITableViewCell {
    @IBOutlet weak var presentImg: UIImageView!
    @IBOutlet weak var heightPresentImg: NSLayoutConstraint!
    @IBOutlet weak var authorImg: UIImageView!
    weak var delegate: ItemsVideoCellHomeDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        customElement()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func customElement() {
        authorImg.setupRadiusFor(view: authorImg, radius: authorImg.frame.height / 2)
        heightPresentImg.constant = contentView.frame.height * 3/4
        setupTapGestureForView(view: authorImg, selector: #selector(onTapAuthorImg), target: self)
    }
    
    @objc func onTapAuthorImg() {
        delegate?.goToAuthor()
    }
}

protocol ItemsVideoCellHomeDelegate: class {
    func goToAuthor()
}
