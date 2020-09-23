//
//  MenuBar.swift
//  Funny
//
//  Created by Apple on 9/19/20.
//

import UIKit



class MenuBar: UIView {
    
    
    let stvK: UIStackView = {
       let stvK = UIStackView()
        stvK.axis = .horizontal
        stvK.distribution = .fillEqually
        stvK.spacing = 10
        stvK.translatesAutoresizingMaskIntoConstraints = false
        return stvK
    }()

    
    var listButtonBar: [ButtonBar] = []
    
    weak var delegate: MenubarDelegate?
 
    convenience init(arrButtonBar: [TypeButtonBar]) {
        self.init(frame: .zero)
        arrButtonBar.forEach { type in
            let buttonBar = ButtonBar(button: type)
            stvK.addArrangedSubview(buttonBar)
            listButtonBar.append(buttonBar)
            buttonBar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapButtonBar(_:))))
            buttonBar.isUserInteractionEnabled = true
        }
    }
    
    @objc func onTapButtonBar(_ tap: UITapGestureRecognizer) {
        guard let buttonBar = tap.view as? ButtonBar else {return}
        delegate?.onTapButtonBar(at: buttonBar)
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stvK)
        NSLayoutConstraint.activate([
            stvK.topAnchor.constraint(equalTo: self.topAnchor),
            stvK.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stvK.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stvK.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    
}


protocol MenubarDelegate: class {
    func onTapButtonBar(at typeButtonBar: ButtonBar)
}


