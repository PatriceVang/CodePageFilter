//
//  Resource.swift
//  FashionApp
//
//  Created by Apple on 4/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class Resource {
    
    class Color {
        static let colorHeader  = #colorLiteral(red: 1, green: 0.3909804772, blue: 0.5798481978, alpha: 1)
        static let colorTapbar = #colorLiteral(red: 0.9270647168, green: 0.6391674876, blue: 0.8065266013, alpha: 1)
        static let chosenColor : UIColor = .brown
        static let chosenSize = #colorLiteral(red: 0.6627923963, green: 0.785212094, blue: 1, alpha: 1)
    }
    
    class Text {
        static let myCart = "My Cart"
        static let logIn = "Login"
        static let sighUp = "Sign Up"
        static let ok = "OK"
    }
    
    class StyleElement {
        
        static func ImgView(imgView: UIImageView) {
            imgView.image = Image.imgLogo
            imgView.layer.cornerRadius = (UIScreen.main.bounds.width / 2)/5
            imgView.clipsToBounds = true
            imgView.contentMode = .scaleAspectFill
            imgView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
            imgView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        }
        
        static func radiusElement(element: UIView, radius: CGFloat) {
            element.layer.cornerRadius = radius
            element.clipsToBounds = true
        }
    }
    
    class Image {
        static let imgLogo = UIImage(named: "ic_logo")
        static let imgSport = UIImage(named: "ic_sport")
        static let imgFacebook = UIImage(named: "ic_facebook")
        static let imgGoogle = UIImage(named: "ic_google")
        static let imgPerson = UIImage(named: "ic_person")
        static let imgLine = UIImage(named: "ic_line")
        static let imgHome = UIImage(named: "ic_home")
        static let imgCart = UIImage(named: "ic_cart")
        static let imgCartNV = UIImage(named: "ic_cart_navi")
        static let imgBgUtitily = UIImage(named: "img_bg_utitily")
        static let imgEye = UIImage(named: "ic_eye")
    }

}


