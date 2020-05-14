//
//  MenuCell.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    @IBOutlet weak var titleItem: UILabel!
    @IBOutlet weak var backgroudCell: UIView!
    var itemsMenu: ItemsMenu? {
        didSet {
            titleItem.text = self.itemsMenu?.items
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        customElement()
    }
    
    private func customElement() {
        backgroudCell.backgroundColor = .systemYellow
    }

}
