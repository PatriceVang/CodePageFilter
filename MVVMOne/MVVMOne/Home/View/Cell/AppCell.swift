//
//  AppCell.swift
//  MVVMOne
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class AppCell: UITableViewCell {
    let nameLb: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let emailLb: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let stackV: UIStackView = {
       let stvk = UIStackView()
        stvk.axis = .vertical
        stvk.distribution = .fillEqually
        stvk.translatesAutoresizingMaskIntoConstraints = false
        return stvk
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackV)
        stackV.addArrangedSubview(nameLb)
        stackV.addArrangedSubview(emailLb)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
    
    }
    
    func setData(user: User) {
        nameLb.text = user.name
//        emailLb.text = user.getAddress()
    }
}
