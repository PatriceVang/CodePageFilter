//
//  MultipleCell.swift
//  DemoVIPER
//
//  Created by Apple on 8/4/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class MultipleCell: UITableViewCell {
    
    var myButton = MyButton(selected: UIImage(named: "ic_prod"), unSelected: UIImage(named: "ic_stag"))
    weak var delelgate: MultipleCelldelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.addSubview(myButton)
        NSLayoutConstraint.activate([
            myButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            myButton.widthAnchor.constraint(equalToConstant: 40),
            myButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        myButton.addTarget(self, action: #selector(onTapmyButton(_:)), for: .touchUpInside)
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValue(user: User) {
        myButton.isSelected = user.isSelected ?? false
        self.textLabel?.text = user.name
    }
    
    
    @objc func onTapmyButton(_ sender: UIButton) {
        delelgate?.onSelectPerson(didSelected: sender.isSelected, at: self)

    }
}

protocol MultipleCelldelegate: class {
    func onSelectPerson(didSelected: Bool, at cell: UITableViewCell)
}
