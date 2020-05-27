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
        
        self.kf.setImage(with: newUrl, placeholder: nil, options: [.transition(.fade(2))])
    }
}

extension Date {
    func toString(_ format: ISODateFormater) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}


extension String {
    func toDate(_ format: ISODateFormater) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self)
    }
}

extension Int {
    func toThoudsandDecima() -> String? {
        let formater = NumberFormatter()
        formater.numberStyle = .decimal
        formater.maximumFractionDigits = 0
        return formater.string(from: NSNumber(value: self))
    }
}



enum ISODateFormater: String {
    case MMddyyyyHHmmss = "yyyy-MM-dd'T'HH:mm:ssZ"
    case MMddyyyyHHmm = "yyyy-MM-dd HH:mm"
    case yyyyMMdd = "yyyy-MM-dd"
}

//2020-05-20T23:00:37Z
