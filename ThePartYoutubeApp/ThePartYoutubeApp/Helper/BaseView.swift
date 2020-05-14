//
//  BaseView.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


extension UIView {
    func setupTapGestureForView(view: UIView, selector: Selector, target: UIView) {
        let tap = UITapGestureRecognizer(target: target, action: selector)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }
    
    func setupTapGestureForVC(view: UIView, selector: Selector, target: UIViewController) {
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

class BaseView: UIViewController {
    
    func setupLabelFor(lable: UILabel, text: String, textColor: UIColor, font: UIFont) {
        lable.text = text
        lable.textColor = textColor
        lable.font = font   
    }
    
    
    
    
    
    
}
