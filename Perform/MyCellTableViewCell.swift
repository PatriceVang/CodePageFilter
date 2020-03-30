//
//  MyCellTableViewCell.swift
//  Perform
//
//  Created by Apple on 3/30/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class MyCellTableViewCell: UITableViewCell {
    @IBOutlet weak var btnChecking: UIButton!
    weak var delegate : MyCellTableViewCellDelegate?
    var indenPath : IndexPath?
    
    //Nên đổi tên thành isChecked hoặc isChosen
    var isChecked : Bool = false
    
    @IBAction func btnCheckBox(_ sender: Any) {
        self.delegate?.onTapBtn(indexPath: indenPath!)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if isChecked == false {
            btnChecking.setTitle("Unchecked", for: .normal)
        } else if isChecked == true {
            btnChecking.setTitle("Checked", for: .normal)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

protocol MyCellTableViewCellDelegate: class {
    func onTapBtn(indexPath: IndexPath)
}




