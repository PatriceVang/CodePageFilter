//
//  MoreCell.swift
//  ProfileReSwift
//
//  Created by Apple on 7/16/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class MoreCell: UITableViewCell {

    let stackView: UIStackView = {
       let stV = UIStackView()
        stV.translatesAutoresizingMaskIntoConstraints = false
        stV.axis = .horizontal
        stV.distribution = .fill
        return stV
    }()
    lazy var titleLable = UILabel()
    lazy var selectedButton = MyButton(selected: UIImage(named: "selected_img"), unSelected: UIImage(named: "unSelected_img"))
    
    weak var delegate: MoreCellDelegate?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {

        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4)
        ])
        stackView.addArrangedSubview(aView)
        selectedButton.isUserInteractionEnabled = false
        aView.addSubview(selectedButton)
        NSLayoutConstraint.activate([
            selectedButton.centerXAnchor.constraint(equalTo: aView.centerXAnchor),
            selectedButton.centerYAnchor.constraint(equalTo: aView.centerYAnchor),
            selectedButton.heightAnchor.constraint(equalToConstant: 30),
            selectedButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        let bView = UIView()
        bView.layer.cornerRadius = 10
        bView.layer.masksToBounds = true
        bView.layer.borderWidth = 1
        bView.layer.borderColor = UIColor.gray.cgColor
        stackView.addArrangedSubview(bView)
        bView.addSubview(titleLable)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLable.centerYAnchor.constraint(equalTo: bView.centerYAnchor),
            titleLable.leadingAnchor.constraint(equalTo: bView.leadingAnchor, constant: 20),
            titleLable.heightAnchor.constraint(equalToConstant: 30)
        ])
        
//        selectedButton.addTarget(self, action: #selector(onTapSelectButton(_:)), for: .touchUpInside)
    }
    
    @objc func onTapSelectButton(_ sender: UIButton) {
        
        self.delegate?.deleteItems(isSelected: sender.isSelected, tableViewCell: self)
    }
    
    func setValue(user: User) {
        selectedButton.isSelected = user.isSelected!
        titleLable.text = user.name
    }
}

protocol MoreCellDelegate: class {
    func deleteItems(isSelected: Bool, tableViewCell: MoreCell?)
}
