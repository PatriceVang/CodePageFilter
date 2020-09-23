//
//  ButtonBar.swift
//  Funny
//
//  Created by Apple on 9/19/20.
//

import UIKit



enum TypeButtonBar {
    case power
    case good
    case bad
    case superman
}



class ButtonBar: UIView {
    
    
    let contentView: UIView = {
        let stv = UIView()
        stv.translatesAutoresizingMaskIntoConstraints = false
        return stv
    }()
    
    let hightlightView: UIView = {
       let hlView = UIView()
        hlView.translatesAutoresizingMaskIntoConstraints = false
        return hlView
    }()
    
    
    let titleButonBar: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        initView()
    }
    
    var type: TypeButtonBar = .bad
    
    convenience init(button: TypeButtonBar) {
        self.init(frame: .zero)
        self.type = button
        
        switch button {
        case .bad:
            titleButonBar.text = "BAD"
        case .good:
            titleButonBar.text = "GOOD"
        case .power:
            titleButonBar.text = "POWER"
        case .superman:
            titleButonBar.text = "SUPER"
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        
        self.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2)
        ])
        
        self.addSubview(hightlightView)
        
        NSLayoutConstraint.activate([
            hightlightView.topAnchor.constraint(equalTo: contentView.bottomAnchor),
            hightlightView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hightlightView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hightlightView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        ])
        

        contentView.addSubview(titleButonBar)
        NSLayoutConstraint.activate([
            titleButonBar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleButonBar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])

    }

}

