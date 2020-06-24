//
//  ResultCell.swift
//  MVVMOne
//
//  Created by Apple on 6/3/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var presentImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupData(user: User) {
        DispatchQueue.global(qos: .utility).async {
            guard let url = URL(string: user.image!) else {return}
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.presentImg.image = UIImage(data: data)
                }
            } catch {
            }
        }
        nameLb.text = user.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}


