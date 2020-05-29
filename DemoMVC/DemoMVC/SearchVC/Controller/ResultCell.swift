//
//  ResultCell.swift
//  DemoMVC
//
//  Created by Apple on 5/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    
    let stackV: UIStackView = {
       let stkV = UIStackView()
        stkV.axis = .horizontal
        stkV.isLayoutMarginsRelativeArrangement = true
        stkV.layoutMargins = .init(top: 5, left: 10, bottom: 5, right: 15)
        stkV.translatesAutoresizingMaskIntoConstraints = false
        stkV.distribution = .fill
        return stkV
    }()
    let aView: UIView = {
        let v = UIView()
        return v
    }()
    let bView: UIView = {
        let v = UIView()
        return v
    }()
    let nameLb: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "1234"
        return lb
    }()
    let addressLb: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.alpha = 0.6
        lb.numberOfLines = 0
        lb.text = "56781723947917032740817098237407189273489710987234890710987328947981789327498718972348971892734"
        return lb
    }()
    let downloadBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle(Resource.Text.download, for: .normal)
        btn.setTitleColor(Resource.Color.colorDownloadBtn, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var user: User? {
        didSet {
            nameLb.text = self.user?.name
            addressLb.text = self.user?.getFullAddress()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // Add stackView
        contentView.addSubview(stackV)
        NSLayoutConstraint.activate([
            stackV.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
               ])
        
        // Add view support
        stackV.addArrangedSubview(aView)
        stackV.addArrangedSubview(bView)
       
        bView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3).isActive = true
        
        // Add lable
        aView.addSubview(nameLb)
        aView.addSubview(addressLb)
        
        NSLayoutConstraint.activate([
            nameLb.topAnchor.constraint(equalTo: aView.topAnchor),
            nameLb.leadingAnchor.constraint(equalTo: aView.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            addressLb.topAnchor.constraint(equalTo: nameLb.bottomAnchor, constant: 3),
            addressLb.leadingAnchor.constraint(equalTo: aView.leadingAnchor),
            addressLb.trailingAnchor.constraint(equalTo: aView.trailingAnchor),
            addressLb.bottomAnchor.constraint(equalTo: aView.bottomAnchor)
        ])
        // Add downloadBtn
        bView.addSubview(downloadBtn)
        NSLayoutConstraint.activate([
            downloadBtn.centerXAnchor.constraint(equalTo: bView.centerXAnchor),
            downloadBtn.centerYAnchor.constraint(equalTo: bView.centerYAnchor)
        ])
        downloadBtn.addTarget(self, action: #selector(onTapDownloadBtn(_:)), for: .touchUpInside)
            
    }
    
    @objc func onTapDownloadBtn(_ sender: UIButton) {
        print("download")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
