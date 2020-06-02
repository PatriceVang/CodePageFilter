//
//  MyCell.swift
//  MVCExpandTableView
//
//  Created by Apple on 6/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var subTitleLb: UILabel!
    var isTapped: Bool = false
    var indexPath: IndexPath?
    
    weak var delegate: MycellDeleegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        subTitleLb.isHidden = true
        self.delegate?.showDetailText(isTapped: isTapped, indexPath: indexPath!)
    }
    
    func setupData(user: User) {
        nameLb.text = user.name
        subTitleLb.text = user.subtitle
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

protocol MycellDeleegate: class {
    func showDetailText(isTapped: Bool, indexPath: IndexPath)
}
