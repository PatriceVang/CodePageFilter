//
//  ItemsVideoCellHome.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ItemsVideoCellHome: UITableViewCell {
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var presentImg: UIImageView!
    @IBOutlet weak var heightPresentImg: NSLayoutConstraint!
    @IBOutlet weak var infoImg: UIImageView!
    @IBOutlet weak var authorImg: UIImageView!
    @IBOutlet weak var subTitleLb: UILabel!
    weak var delegate: ItemsVideoCellHomeDelegate?
    var videos: Videos? {
        didSet {
            guard let imageString = self.videos?.image else {return}
            guard let authorImgString = self.videos?.profileImg else {return}
            presentImg.setImage(url:imageString)
            titleLb.text = self.videos?.title
            guard let name = self.videos?.name else {return}
            guard let views = self.videos?.views else {return}
            subTitleLb.text = "\(name) • \(views)"
            authorImg.setImage(url:authorImgString )
        }
    }
    
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
        setupTapGesture(view: authorImg, selector: #selector(onTapAuthorImg), target: self)
        setupTapGesture(view: infoImg, selector: #selector(onTapInfoImg), target: self)
    }
    
    @objc func onTapAuthorImg() {
        if let name = videos?.name {
            delegate?.onTapAuthor(name: name)
        }
    }
    @objc func onTapInfoImg() {
        delegate?.displaySettingView()
    }
}

protocol ItemsVideoCellHomeDelegate: class {
    func displaySettingView()
    func onTapAuthor(name: String)
}
