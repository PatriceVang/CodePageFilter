//
//  MyButton.swift
//  DemoReactCocoA
//
//  Created by Apple on 7/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit




class MyButton: UIButton {
    
    var didSelected: UIImage?
    
    var unSelected: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(selected: UIImage?, unSelected: UIImage?) {
        self.init(frame: .zero)
        self.didSelected = selected
        self.unSelected = unSelected
        setImage(selected, for: .selected)
        setImage(unSelected, for: .normal)
        addTarget(self, action: #selector(onChangeImgWhenSelected(_:)), for: .touchUpInside)
        
    }
    
    private func setupUI() {
        
    }
    
    @objc func onChangeImgWhenSelected(_ sender: MyButton) {
        isSelected = !sender.isSelected
    }
}


extension UIView {
    public func layout(with view: UIView, top: CGFloat?, leading: CGFloat?, trailing: CGFloat?, bottom: CGFloat?) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: top!),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom!),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading!),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing!)
        ])
    }
}
