//
//  HeaderExplore.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class HeaderExplore: UITableViewHeaderFooterView {
    
    let stkV: UIStackView = {
       let stk = UIStackView()
        stk.axis = .horizontal
        stk.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        stk.isLayoutMarginsRelativeArrangement = true
        stk.distribution = .fillEqually
        stk.translatesAutoresizingMaskIntoConstraints = false
        stk.spacing = 10
        return stk
    }()
    
    let trendingImg: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = true
        img.image = Resource.Image.trendingImg
        img.contentMode = .scaleAspectFill
        return img
    }()
    let musicImg: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = true
        img.image = Resource.Image.musicImg
        img.contentMode = .scaleAspectFill
        return img
    }()
    let gamingImg: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = true
        img.image = Resource.Image.gamingImg
        img.contentMode = .scaleAspectFill
        return img
    }()
    let newsImg: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = true
        img.image = Resource.Image.newsImg
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
        
        
        
        self.addSubview(stkV)
        NSLayoutConstraint.activate([
            stkV.topAnchor.constraint(equalTo: self.topAnchor),
            stkV.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stkV.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stkV.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        let supportVa = UIStackView()
        supportVa.axis = .vertical
        supportVa.spacing = 10
        supportVa.distribution = .fillEqually
        let supportVb = UIStackView()
        supportVb.axis = .vertical
        supportVb.spacing = 10
        supportVb.distribution = .fillEqually
        
        
        stkV.addArrangedSubview(supportVa)
        stkV.addArrangedSubview(supportVb)
        
        supportVa.addArrangedSubview(trendingImg)
        supportVa.addArrangedSubview(gamingImg)
        supportVb.addArrangedSubview(musicImg)
        supportVb.addArrangedSubview(newsImg)
        
        setupTapGesture(view: trendingImg, selector: #selector(onTapBannerTrending), target: self)
        setupTapGesture(view: musicImg, selector: #selector(onTapBannerMusic), target: self)
        setupTapGesture(view: newsImg, selector: #selector(onTapBannerNews), target: self)
        setupTapGesture(view: gamingImg, selector: #selector(onTapBannerGaming), target: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .blue
    }
    
    @objc func onTapBannerTrending() {
        print("trending")
    }
    @objc func onTapBannerMusic() {
        print("music")
    }
    @objc func onTapBannerNews() {
        print("news")
    }
    @objc func onTapBannerGaming() {
        print("gaming")
    }
}
