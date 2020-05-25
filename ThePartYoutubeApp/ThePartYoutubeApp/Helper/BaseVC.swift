//
//  BaseView.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    deinit {
        print(String(describing: Self.self) + "is deinited")
    }
    
    func setupLabelFor(lable: UILabel, text: String, textColor: UIColor, font: UIFont) {
        lable.text = text
        lable.textColor = textColor
        lable.font = font   
    }
}
