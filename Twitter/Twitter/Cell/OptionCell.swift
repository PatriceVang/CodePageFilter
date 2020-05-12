//
//  OptionCell.swift
//  Twitter
//
//  Created by Apple on 5/10/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class OptionCell: UICollectionViewCell {
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    let presentImg: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    let nameLb: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let countryLb: UILabel = {
       let sub = UILabel()
        sub.translatesAutoresizingMaskIntoConstraints = false
        return sub
    }()
    let followBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Follow", for: .normal)
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.backgroundColor = .white
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = #colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1)
        return btn
    }()
    let descrition: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 0
        lb.lineBreakMode = .byTruncatingTail
        return lb
    }()
    let learnMoreBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = true
        btn.setTitle("Learn more...", for: .normal)
        btn.alpha = 0.6
        btn.addTarget(self, action: #selector(onTaLearnMoreBtn(sender:)), for: .touchUpInside)
        return btn
    }()
    var user: User? {
        didSet {
            nameLb.text = self.user?.name
            countryLb.text = self.user?.country
            descrition.text = self.user?.descrition
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.backgroundColor = .white
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setupShadow()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(presentImg)
        presentImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        presentImg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        presentImg.widthAnchor.constraint(equalToConstant: 50).isActive = true
        presentImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        // Name lB
        contentView.addSubview(nameLb)
        nameLb.topAnchor.constraint(equalTo: presentImg.topAnchor).isActive = true
        nameLb.leadingAnchor.constraint(equalTo: presentImg.trailingAnchor, constant: 5).isActive = true
        // Contry LB
        contentView.addSubview(countryLb)
        countryLb.topAnchor.constraint(equalTo: nameLb.bottomAnchor, constant: 0).isActive = true
        countryLb.leadingAnchor.constraint(equalTo: nameLb.leadingAnchor).isActive = true
        // Follow Btn
        contentView.addSubview(followBtn)
        followBtn.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        followBtn.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        followBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        followBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        // descriton LB
        contentView.addSubview(descrition)
        descrition.leadingAnchor.constraint(equalTo: countryLb.leadingAnchor).isActive = true
        descrition.topAnchor.constraint(equalTo: countryLb.bottomAnchor, constant: 5).isActive = true
        descrition.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        descrition.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        // Learn more Btn
//        contentView.addSubview(learnMoreBtn)
//        NSLayoutConstraint.activate([
//            learnMoreBtn.topAnchor.constraint(equalTo: descrition.bottomAnchor, constant: 5),
//            learnMoreBtn.widthAnchor.constraint(equalToConstant: descrition.frame.width),
//            learnMoreBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
//        ])
        
    }
    
    private func setupShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 16
        self.layer.masksToBounds = false
    }
    
    @objc func onTaLearnMoreBtn(sender: UIButton) {
        print("learn more...")
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
}
