//
//  StackView.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

enum OptionType {
    case airlay
    case learnmore
    case linkTV
    case cancel
}




class StackViewHor: BaseViewXib {

    @IBOutlet weak var presentImg: UIImageView!
    @IBOutlet weak var contentLb: UILabel!
    var opType: OptionType = .airlay
    
    //config  View
    override func initView() {
        
    }
    
    convenience init(type: OptionType) {
        self.init(frame: .zero)
        opType = type
        switch opType {
        case .airlay:
            presentImg.image = Resource.Image.ariplayImg
            contentLb.text = Resource.Text.airPlay
        case .learnmore:
            presentImg.image = Resource.Image.learnMoreImg
            contentLb.text = Resource.Text.learnMore
        case .linkTV:
            presentImg.image = Resource.Image.linkImg
            contentLb.text = Resource.Text.linkWithTv
        case .cancel:
            presentImg.image = Resource.Image.cancelImg
            contentLb.text = Resource.Text.cancel
        default:
            break
        }
    }
    
   
}




