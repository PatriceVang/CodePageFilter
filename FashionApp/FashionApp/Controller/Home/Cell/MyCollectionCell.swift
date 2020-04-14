//
//  MyCollectionCell.swift
//  FashionApp
//
//  Created by Apple on 4/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class MyCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lbTitleItem: UILabel!
    @IBOutlet weak var viewBackgroud: UIView!
    var model: ModelCell? {
        didSet {
            let q = DispatchQueue(label: "Loadhinh")
            q.async {
                let url = URL(string: self.model?.actor?.picture ?? "")
                do {
                    let data = try Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        self.imgItem.image = UIImage(data: data)
                    }
                } catch{}
            }
            lbTitleItem.text = self.model?.actor?.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        self.layer.shadowColor = .init(genericGrayGamma2_2Gray: 2, alpha: 1)
        self.layer.shadowOffset = .init(width: 20, height: 20)
    }
}

struct ModelCell {
    var actor: Actor?
}
