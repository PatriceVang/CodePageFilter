//
//  OptionCell.swift
//  MessageApp
//
//  Created by Apple on 5/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class OptionCell: UITableViewCell {
    @IBOutlet weak var msgLb: UILabel!
    @IBOutlet weak var bubbleV: UIView!
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthMsgLb: NSLayoutConstraint!
    var msg: Message? {
        didSet {
            msgLb.text = self.msg?.msg
            msgLb.textColor = self.msg?.ofOwnUser == true ? .black : .white
            bubbleV.backgroundColor = self.msg?.ofOwnUser == true ? .white : .systemBlue
            guard let msgOfOwnUser = self.msg?.ofOwnUser else {return}
            if msgOfOwnUser {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                trailingConstraint.isActive = true
                leadingConstraint.isActive = false
            }
        }
            
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        addShadow()
        customElement()
        
    }
    
    private func customElement() {
        //BubbleV
        bubbleV.backgroundColor = .white
        bubbleV.layer.cornerRadius = bubbleV.frame.height * 0.1
        bubbleV.layer.masksToBounds = true
        //Msg Lb
        self.textLabel?.numberOfLines = 0
        msgLb.numberOfLines = 0
        widthMsgLb.constant = self.frame.width * 2.8/3
        leadingConstraint = msgLb.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        trailingConstraint = msgLb.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func addShadow() {
        bubbleV.layer.shadowColor = UIColor.black.cgColor
        bubbleV.layer.shadowOpacity = 0.2
        bubbleV.layer.shadowOffset = CGSize.zero
        bubbleV.layer.shadowRadius = 16
        bubbleV.layer.masksToBounds = false
    }
    
}
