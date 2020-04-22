//
//  BaseViewXib.swift
//  CustomView
//
//  Created by Apple on 4/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//


import Foundation
import UIKit

class BaseViewXib: UIView {
    
    override var backgroundColor: UIColor? {
        didSet {
            view?.backgroundColor = backgroundColor
        }
    }
    
    private var view : UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    func loadViewFromNib() {
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: Bundle.main)
        view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        view?.frame = bounds
        addSubview(view ?? UIView())
        view?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        initView()
    }
    
    func initView() {}
}
