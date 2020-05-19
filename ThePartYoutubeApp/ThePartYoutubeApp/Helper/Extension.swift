//
//  Extension.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/16/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Kingfisher


extension UIView {
    func setupTapGesture(view: UIView, selector: Selector, target: Any) {
        let tap = UITapGestureRecognizer(target: target, action: selector)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }
    func setupRadiusFor(view: UIView, radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
    func setupLabelFor(lable: UILabel, text: String, textColor: UIColor, font: UIFont) {
        lable.text = text
        lable.textColor = textColor
        lable.font = font
    }
}


extension UIImageView {
    func setImage(url: String) {
        guard let newUrl = URL(string: url) else {return}
        self.kf.indicatorType = .activity
        self.kf.setImage(with: newUrl, placeholder: image, options: [.transition(.fade(1))])
    }
}
