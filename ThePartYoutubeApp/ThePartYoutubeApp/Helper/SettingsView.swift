//
//  SupportView.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/17/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class SettingsView: NSObject {
    let viewBlack: UIView = {
       let v = UIView()
        v.backgroundColor = .black
        v.translatesAutoresizingMaskIntoConstraints = false
        v.alpha = 0.5
       
        return v
    }()
    
    let view = UIView()
    func showSettingsView(views: UIView) {
        if let keyWindow = UIApplication.shared.keyWindow {
            view.frame = keyWindow.frame
            view.backgroundColor = .clear
            keyWindow.addSubview(view)
            view.addSubview(viewBlack)
            viewBlack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapDismiss)))
            viewBlack.isUserInteractionEnabled = true
            let settingsV = SupportView(views: views)
            view.addSubview(settingsV)
            view.frame = .init(x: keyWindow.frame.minX, y: keyWindow.frame.maxY, width: keyWindow.frame.width, height: 0 )
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.frame = keyWindow.frame
                NSLayoutConstraint.activate([
                    settingsV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    settingsV.trailingAnchor.constraint(equalTo:self.view.trailingAnchor),
                    settingsV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                    settingsV.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2.2),
                    settingsV.widthAnchor.constraint(equalToConstant: self.view.frame.width)
                ])
                NSLayoutConstraint.activate([
                    self.viewBlack.topAnchor.constraint(equalTo: self.view.topAnchor),
                    self.viewBlack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    self.viewBlack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    self.viewBlack.bottomAnchor.constraint(equalTo: settingsV.topAnchor),
                ])
            }) { (completed) in
            }
        }
    }
    
    @objc func onTapDismiss() {
        print("tap")
        view.removeFromSuperview()
    }
}


class SupportView: UIView {

    lazy var settingsV = UIView()
    let stkV: UIStackView = {
       let stk = UIStackView()
        stk.translatesAutoresizingMaskIntoConstraints = false
        stk.axis = .vertical
        return stk
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience  init(views: UIView) {
        self.init(frame:.zero)
        self.settingsV = views
    }
    
    func setupView() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stkV)
        NSLayoutConstraint.activate([
            stkV.topAnchor.constraint(equalTo: self.topAnchor),
            stkV.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stkV.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stkV.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        stkV.addArrangedSubview(settingsV)
        
    }
}
