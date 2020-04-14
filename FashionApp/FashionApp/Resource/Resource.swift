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
        static let colorTapbar = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        static let chosenColor : UIColor = .brown
        static let chosenSize = #colorLiteral(red: 0.6627923963, green: 0.785212094, blue: 1, alpha: 1)
    }
    
    class Text {
        static var textHeaderLogin : UILabel = {
            let lg = UILabel()
            lg.text = "Login"
            lg.font = .boldSystemFont(ofSize: 30)
            lg.textColor = .white
            return lg
        }()
        static var textHeaderSignup : UILabel = {
            let lg = UILabel()
            lg.text = "Sign up"
            lg.font = .boldSystemFont(ofSize: 30)
            lg.textColor = .white
            return lg
        }()
        static var textHeaderHome : UILabel = {
            let lg = UILabel()
            lg.text = "Home"
            lg.font = .boldSystemFont(ofSize: 30)
            lg.textColor = .white
            return lg
        }()
    }
    
    class StyleElement {
        static func styleTextField(textfield: UITextField, placeHolder: String) {
            textfield.placeholder = placeHolder
            textfield.layer.cornerRadius = 7
            textfield.borderStyle = .none
            textfield.layer.borderWidth = 2
            textfield.layer.borderColor = #colorLiteral(red: 1, green: 0.3909804772, blue: 0.5798481978, alpha: 1)
            let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
            textfield.leftView = padding
            textfield.leftViewMode = .always
        }
        
        static func styleBtn(btn: UIButton, title: String) {
            btn.setTitle(title, for: .normal)
            btn.layer.cornerRadius = 15
            btn.backgroundColor = #colorLiteral(red: 1, green: 0.3909804772, blue: 0.5798481978, alpha: 1)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 25)
        }
        
        static func ImgView(imgView: UIImageView) {
            imgView.image = Image.imgLogo
            imgView.layer.cornerRadius = (UIScreen.main.bounds.width / 2)/5
//            imgView.layer.masksToBounds = true
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
    }

}


