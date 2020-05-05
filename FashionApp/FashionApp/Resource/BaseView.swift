//
//  BaseView.swift
//  FashionApp
//
//  Created by Apple on 4/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class BaseView: UIViewController {
    func setupUIView(color: UIColor, radius: CGFloat, view: UIView){
        view.backgroundColor = color
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
    }
    func setupAnimationMove(view: UIView, delay: CGFloat, target: UIViewController) {
        UIView.animate(withDuration: 0.05, delay: TimeInterval(delay), usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            view.bounds.size.width += 5
        }) { finished in
            UIView.animate(withDuration: 0.05, delay: TimeInterval(delay), options: .curveEaseOut, animations: {
                view.bounds.size.width -= 5
            }, completion: nil)
        }
    }
    func setupAnimationColor(view: UIView, delay: CGFloat, target: UIViewController) {
        UIView.animate(withDuration: 0.05, delay: TimeInterval(delay), usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            view.backgroundColor = .lightGray
        }) { finished in
            UIView.animate(withDuration: 0.05, delay: TimeInterval(delay), options: .curveEaseOut, animations: {
                view.backgroundColor = .white
            }, completion: nil)
        }
    }
}
